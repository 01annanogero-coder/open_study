# Open Study

A Flutter app that searches **free, openly-licensed** study material (textbooks,
articles, research papers and video) and shows every result inside the app.

Open Study is only a search tool. It has **no server of its own** and does not
host, copy, cache or resell anything. The phone talks directly to each
provider's official public API, and every result opens the provider's own page.

## What the app has

- **Home:** a search bar, six subject shortcuts and hand-picked starting topics. Each one simply starts a normal search.
- **Search:** results from all sources at once, each with its provider and licence.
- **Saved:** bookmarks and recent searches, stored only on the phone and clearable at any time.
- **About:** the sources, licences, attribution notices and privacy notes.
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
  models/study_resource.dart        # StudyResource, SearchResult
  services/
    search_service.dart             # runs all sources at once, merges, makes chips
    sources/                        # one class per provider (official APIs only)
    local_store.dart                # bookmarks and recent searches, on the phone only
  screens/
    app_shell.dart                  # bottom navigation: Home, Search, Saved, About
    home_screen.dart                # search bar, subjects, starting topics
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
