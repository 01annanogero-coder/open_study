/// Barrel file exporting all open content sources and the default source list.
library;

export 'license_labels.dart';
export 'internet_archive_source.dart';
export 'wikipedia_source.dart';
export 'arxiv_source.dart';
export 'openalex_source.dart';
export 'doaj_source.dart';
export 'openstax_source.dart';
export 'youtube_cc_source.dart';

import 'internet_archive_source.dart';
import 'wikipedia_source.dart';
import 'arxiv_source.dart';
import 'openalex_source.dart';
import 'doaj_source.dart';
import 'openstax_source.dart';
import 'youtube_cc_source.dart';
import 'open_source.dart';

/// Returns the default list of all seven open content sources in the prescribed order:
/// 1. Internet Archive
/// 2. Wikipedia
/// 3. OpenStax
/// 4. YouTube (Creative Commons) - uses API key from environment
/// 5. OpenAlex
/// 6. arXiv
/// 7. DOAJ
List<OpenSource> defaultSources() {
  return [
    InternetArchiveSource(),
    WikipediaSource(),
    OpenStaxSource(),
    YouTubeCcSource(const String.fromEnvironment('YOUTUBE_API_KEY')),
    OpenAlexSource(),
    ArxivSource(),
    DoajSource(),
  ];
}