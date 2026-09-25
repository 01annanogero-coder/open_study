# Open Study

A Flutter app for studying with **free, openly-licensed** material: it searches
textbooks, articles, research papers and video, and organises whole free
textbooks into lessons by subject.

Open Study has **no server of its own**. The phone talks directly to each
provider's official public API, and every search result and online lesson opens
the provider's own page. The only text inside the app is from a public-domain
book (G. H. Hardy's *A Course of Pure Mathematics*), which can be read offline.

## What the app has

- **Home:** a search bar, subject shortcuts and hand-picked starting topics.
- **Subjects with lessons:** Mathematics, Computer Science, Business & Economics, Engineering,
  Social Sciences, Physics, Chemistry, Biology, Psychology and History each open a page with
  two tabs: **Lessons** (free textbooks, grouped into shelves, split into chapters and
  sections) and **Search results**. Over 50 OpenStax textbooks open section by section on
  openstax.org; *Engineering Statics* opens on engineeringstatics.org; Hardy's *A Course of
  Pure Mathematics* is built in, with typeset formulas, and works offline.
- **Search:** results from all sources at once, each with its provider and licence.
- **Saved:** bookmarks and recent searches, stored only on the phone and clearable at any time.
- **About:** the sources, licences, attribution notices, privacy notes and update settings.
- **Automatic updates:** see below.
- **No accounts:** there is no sign-in, no server and no analytics.

## What the app does not do

- It does not remove paywalls, log-in walls, blur overlays or adverts.
- It does not scrape web pages, imitate a browser, or use unofficial or private
  endpoints.
- It does not download, extract or proxy video or file streams. YouTube videos
  play in YouTube's official embedded player.
- It never labels content with a licence the provider did not state. Where a
  provider gives no licence (for example arXiv), the result says so.

## Sources

| Source | Content | What the app shows as licence | Key |
|---|---|---|---|
| [Internet Archive](https://archive.org) | Books, video, courses | The item's own Creative Commons or public-domain licence (items without one are dropped) | No |
| [Wikipedia](https://en.wikipedia.org) | Background articles | CC BY-SA 4.0 | No |
| [OpenStax](https://openstax.org) | Free textbooks | The licence each book states | No |
| [OpenAlex](https://openalex.org) | Open-access papers | The licence OpenAlex reports (works without one are dropped) | No |
| [arXiv](https://arxiv.org) | Preprints | "Free to read" (authors choose their own terms) | No |
| [DOAJ](https://doaj.org) | Open-access journal articles | "Open access (see article)" | No |
| [YouTube Data API](https://developers.google.com/youtube/v3) | Video published under Creative Commons Attribution | CC BY | Optional |

The About screen in the app lists these sources, the attribution notices they
ask for, and the privacy notes for students.

## Install (Android)

Open Study is available for Android 7.0 or newer. There is no iPhone version yet.

1. Download `OpenStudy-<version>.apk` from the [latest release](https://github.com/01annanogero-coder/open_study/releases/latest).
2. Open the file on your phone. If Android asks, allow your browser or file manager to install apps.
3. Open **Open Study**.

Each release lists a SHA-256 checksum for the file and the fingerprint of the key it is signed with, so you can check that your download is genuine.

### Updates

From version 1.0.2 the app keeps itself up to date. About once a day it asks GitHub for
the latest release and, on Wi-Fi by default, downloads the new APK in the background. The
download is kept only if it matches the release's `SHA256SUMS.txt`, and Android refuses
any update not signed with the same key.

- **Android 12 and newer:** after you allow *Install unknown apps* for Open Study once, the
  update installs by itself when you leave the app, and the next launch runs the new version.
- **Android 7 to 11:** the app shows *Update ready* with an Install button.

Both can be turned off in **About → Updates**, which also has **Check now**. Versions 1.0.0
and 1.0.1 cannot update themselves; install 1.0.2 once by hand.

Every release must include `OpenStudy-<version>.apk` and `SHA256SUMS.txt`, and its tag
must be higher than the previous one (for example `v1.0.3`).

## Running the app

There is no backend to deploy.

```bash
flutter pub get
flutter run
```

### Optional: YouTube results

Create a YouTube Data API v3 key in Google Cloud, restrict it to the YouTube
Data API and to this app's Android package and signing certificate, then:

```bash
flutter run --dart-define=YOUTUBE_API_KEY=YOUR_RESTRICTED_KEY
```

Without a key, the YouTube source simply returns nothing.

## Checking that the sources still work

```bash
node tool/verify_sources.js "software engineering"   # live check of every API
dart run tool/live_check.dart "software engineering" # same, through the app's own classes
flutter test
flutter analyze
```

## Project layout

```
lib/
  main.dart
  app_info.dart                     # version (keep in step with pubspec.yaml)
  models/
    study_resource.dart             # StudyResource, SearchResult
    course.dart                     # Course, CourseChapter, Lesson
  data/
    course_catalog.dart             # which courses each subject shows, in shelves
    courses/                        # one file per book (openstax/ is generated)
  services/
    search_service.dart             # runs all sources at once, merges, makes chips
    sources/                        # one class per provider (official APIs only)
    local_store.dart                # bookmarks, recent searches, settings, on the phone only
    update_checker.dart             # asks GitHub for the latest release
    update_manager.dart             # downloads, verifies and installs updates
    update_platform.dart            # the Android side (MainActivity.kt, UpdateInstallReceiver.kt)
  screens/
    app_shell.dart                  # bottom navigation: Home, Search, Saved, About
    home_screen.dart                # search bar, subjects, starting topics
    subject_screen.dart             # a subject's Lessons and Search results tabs
    course_screen.dart              # a book's chapters and lessons
    lesson_screen.dart              # reader for built-in lessons (formulas typeset)
    search_screen.dart
    saved_screen.dart
    document_viewer_screen.dart     # provider's page, unmodified, with attribution
    video_player_screen.dart        # official YouTube player
    about_screen.dart               # sources, licences, privacy
    open_resource.dart              # opens a result the same way from every screen
  widgets/
tool/
  verify_sources.js
  live_check.dart
```

## Adding a course

Add a course file under `lib/data/courses/` (see `hardy_pure_mathematics.dart` for built-in
text, or any file in `openstax/` for lessons that open the publisher's pages), then place it
on a shelf in `lib/data/course_catalog.dart` under the subject id used on Home. Only add
books whose licence allows it, and set `license`, `licenseUrl` and `sourceNote` so the
student sees where the text comes from.

## Adding a source

Implement `OpenSource` (see `lib/services/sources/open_source.dart`), use only
an official public API, send the shared `kUserAgent`, return only licences the
provider states, and add it to `defaultSources()`. Add a test with `MockClient`
and a check in `tool/verify_sources.js`.

## Notes

Licences come from the providers and can be wrong or change. Check the licence
before reusing anything. If you believe an item is wrongly listed, tell the
provider that hosts it.

## Licence

The source code of this app is released under the [MIT License](LICENSE), so
anyone may use, copy, change and share it. That licence covers the app's code
only. The study material the app finds belongs to its authors and providers and
stays under the licences shown next to each result.
