import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:open_study_app/main.dart';
import 'package:open_study_app/screens/app_shell.dart';
import 'package:open_study_app/services/local_store.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> pumpApp(WidgetTester tester) async {
  SharedPreferences.setMockInitialValues({});
  final store = await LocalStore.open();
  await tester.pumpWidget(OpenStudyApp(store: store, checkForUpdates: false));
}

void main() {
  testWidgets('home shows the header, search bar, subjects and recommendations',
      (tester) async {
    // A tall screen, so the lazily built list shows every section at once.
    tester.view.physicalSize = const Size(900, 2600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    await pumpApp(tester);

    expect(find.text('Open Study'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Popular Subjects'), findsOneWidget);
    expect(find.text('Mathematics'), findsWidgets);
    expect(find.text('Engineering'), findsOneWidget);
    expect(find.text('Recommended for you'), findsOneWidget);
    expect(find.text('Python for Beginners'), findsOneWidget);

    // No invented ratings or lesson counts, and no sign-in anywhere.
    expect(find.textContaining('lessons'), findsNothing);
    expect(find.textContaining('Sign in'), findsNothing);
    expect(find.textContaining('Log in'), findsNothing);
  });

  testWidgets('bottom bar has Home, Search, Saved and About', (tester) async {
    await pumpApp(tester);

    for (final label in ['Home', 'Search', 'Saved', 'About']) {
      expect(find.descendant(of: find.byType(BottomTabBar), matching: find.text(label)),
          findsOneWidget);
    }
  });

  testWidgets('saved tab is empty and says data stays on the phone', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.descendant(of: find.byType(BottomTabBar), matching: find.text('Saved')));
    await tester.pumpAndSettle();

    expect(find.text('Stored only on this phone. Nothing is sent anywhere.'), findsOneWidget);
    expect(find.text('Words you search for will appear here.'), findsOneWidget);
    expect(find.text('Tap the bookmark icon on a result to keep it here.'), findsOneWidget);
  });

  testWidgets('about tab explains sources and privacy', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.descendant(of: find.byType(BottomTabBar), matching: find.text('About')));
    await tester.pumpAndSettle();

    expect(find.text('Where results come from'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Privacy'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Privacy'), findsOneWidget);
  });

  testWidgets('the info button on Home opens the About tab', (tester) async {
    await pumpApp(tester);

    await tester.tap(find.byIcon(Icons.info_outline_rounded).first);
    await tester.pumpAndSettle();

    expect(find.text('About Open Study'), findsOneWidget);
  });
}
