# Open Study

A Flutter app that searches **free, openly-licensed** study material (textbooks,
articles, research papers and video) and shows every result inside the app.

Open Study is only a search tool. It has **no server of its own** and does not
host, copy, cache or resell anything. The phone talks directly to each
provider's official public API, and every result opens the provider's own page.

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
  screens/
    search_screen.dart
    document_viewer_screen.dart     # provider's page, unmodified, with attribution
    video_player_screen.dart        # official YouTube player
    about_screen.dart               # sources, licences, privacy
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
