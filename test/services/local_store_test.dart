import 'package:flutter_test/flutter_test.dart';
import 'package:open_study_app/models/study_resource.dart';
import 'package:open_study_app/services/local_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late SharedPreferences prefs;

  StudyResource makeResource({
    String id = '1',
    String title = 'Test Resource',
    String source = 'Test Source',
    String license = 'CC BY 4.0',
    String url = 'https://example.com/1',
  }) {
    return StudyResource(
      id: id,
      title: title,
      source: source,
      license: license,
      type: ResourceType.article,
      url: url,
    );
  }

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    prefs = await SharedPreferences.getInstance();
  });

  group('LocalStore', () {
    test('empty start', () async {
      final store = await LocalStore.open(prefs: prefs);
      expect(store.saved, isEmpty);
      expect(store.recentSearches, isEmpty);
    });

    test('toggleSaved adds then removes', () async {
      final store = await LocalStore.open(prefs: prefs);
      final resource = makeResource();

      expect(store.isSaved(resource.url), isFalse);

      await store.toggleSaved(resource);
      expect(store.saved.length, 1);
      expect(store.saved.first.url, resource.url);
      expect(store.isSaved(resource.url), isTrue);

      await store.toggleSaved(resource);
      expect(store.saved, isEmpty);
      expect(store.isSaved(resource.url), isFalse);
    });

    test('newest first ordering', () async {
      final store = await LocalStore.open(prefs: prefs);
      final r1 = makeResource(id: '1', url: 'https://example.com/1');
      final r2 = makeResource(id: '2', url: 'https://example.com/2');
      final r3 = makeResource(id: '3', url: 'https://example.com/3');

      await store.toggleSaved(r1);
      await store.toggleSaved(r2);
      await store.toggleSaved(r3);

      expect(store.saved.map((r) => r.url).toList(),
          ['https://example.com/3', 'https://example.com/2', 'https://example.com/1']);
    });

    test('bookmarks survive re-opening the store with the same mocked preferences', () async {
      final store1 = await LocalStore.open(prefs: prefs);
      final r1 = makeResource(id: '1', url: 'https://example.com/1');
      final r2 = makeResource(id: '2', url: 'https://example.com/2');
      await store1.toggleSaved(r1);
      await store1.toggleSaved(r2);

      // Create a new store with the same prefs
      final store2 = await LocalStore.open(prefs: prefs);
      expect(store2.saved.length, 2);
      expect(store2.saved.map((r) => r.url).toList(),
          ['https://example.com/2', 'https://example.com/1']);
    });

    test('cap of 200 saved resources', () async {
      final store = await LocalStore.open(prefs: prefs);
      for (int i = 0; i < 210; i++) {
        await store.toggleSaved(makeResource(
          id: '$i',
          url: 'https://example.com/$i',
        ));
      }
      expect(store.saved.length, 200);
      // The oldest (first added) should be dropped
      expect(store.saved.last.url, 'https://example.com/10');
    });

    test('corrupt JSON is ignored without throwing', () async {
      // Write corrupt JSON directly
      await prefs.setString('saved_resources_v1', 'not valid json');

      final store = await LocalStore.open(prefs: prefs);
      expect(store.saved, isEmpty);
    });

    test('corrupt entry in JSON array is skipped', () async {
      // Write JSON with one valid and one corrupt entry
      const validJson = '[{"id":"1","title":"Valid","source":"S","license":"CC BY","type":"article","url":"https://example.com/1","licenseUrl":null,"thumbnailUrl":null,"description":null,"creator":null}, "not an object"]';
      await prefs.setString('saved_resources_v1', validJson);

      final store = await LocalStore.open(prefs: prefs);
      expect(store.saved.length, 1);
      expect(store.saved.first.url, 'https://example.com/1');
    });

    group('recent searches', () {
      test('trims text and ignores empty', () async {
        final store = await LocalStore.open(prefs: prefs);

        await store.addRecentSearch('  hello  ');
        expect(store.recentSearches, ['hello']);

        await store.addRecentSearch('   ');
        expect(store.recentSearches, ['hello']);

        await store.addRecentSearch('');
        expect(store.recentSearches, ['hello']);
      });

      test('duplicate moves to front ignoring case', () async {
        final store = await LocalStore.open(prefs: prefs);

        await store.addRecentSearch('apple');
        await store.addRecentSearch('banana');
        await store.addRecentSearch('APPLE');

        expect(store.recentSearches, ['APPLE', 'banana']);
      });

      test('cap of 10', () async {
        final store = await LocalStore.open(prefs: prefs);

        for (int i = 0; i < 12; i++) {
          await store.addRecentSearch('query$i');
        }
        expect(store.recentSearches.length, 10);
        // Newest first, so query11 is first, query2 is last (query0 and query1 dropped)
        expect(store.recentSearches.first, 'query11');
        expect(store.recentSearches.last, 'query2');
      });

      test('removeRecentSearch', () async {
        final store = await LocalStore.open(prefs: prefs);

        await store.addRecentSearch('apple');
        await store.addRecentSearch('banana');
        await store.addRecentSearch('cherry');

        await store.removeRecentSearch('banana');
        expect(store.recentSearches, ['cherry', 'apple']);

        // Case insensitive
        await store.removeRecentSearch('CHERRY');
        expect(store.recentSearches, ['apple']);
      });

      test('clearRecentSearches', () async {
        final store = await LocalStore.open(prefs: prefs);

        await store.addRecentSearch('apple');
        await store.addRecentSearch('banana');
        await store.clearRecentSearches();

        expect(store.recentSearches, isEmpty);
      });
    });

    group('listeners', () {
      test('toggleSaved notifies', () async {
        final store = await LocalStore.open(prefs: prefs);
        var notifyCount = 0;
        store.addListener(() => notifyCount++);

        final resource = makeResource();
        await store.toggleSaved(resource);
        expect(notifyCount, 1);

        await store.toggleSaved(resource);
        expect(notifyCount, 2);
      });

      test('clearSaved notifies', () async {
        final store = await LocalStore.open(prefs: prefs);
        await store.toggleSaved(makeResource());
        var notifyCount = 0;
        store.addListener(() => notifyCount++);

        await store.clearSaved();
        expect(notifyCount, 1);
      });

      test('addRecentSearch notifies', () async {
        final store = await LocalStore.open(prefs: prefs);
        var notifyCount = 0;
        store.addListener(() => notifyCount++);

        await store.addRecentSearch('test');
        expect(notifyCount, 1);
      });

      test('removeRecentSearch notifies', () async {
        final store = await LocalStore.open(prefs: prefs);
        await store.addRecentSearch('test');
        var notifyCount = 0;
        store.addListener(() => notifyCount++);

        await store.removeRecentSearch('test');
        expect(notifyCount, 1);
      });

      test('clearRecentSearches notifies', () async {
        final store = await LocalStore.open(prefs: prefs);
        await store.addRecentSearch('test');
        var notifyCount = 0;
        store.addListener(() => notifyCount++);

        await store.clearRecentSearches();
        expect(notifyCount, 1);
      });
    });
  });
}