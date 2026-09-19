import 'package:http/http.dart' as http;
import '../../models/study_resource.dart';

/// Identifies this app honestly to every provider. Never imitate a browser.
const String kUserAgent = 'OpenStudyApp/1.0 (educational open-content search)';

/// Maximum results any one source may contribute per search.
const int kMaxPerSource = 5;

/// Thrown by a source when its provider fails (HTTP error, bad payload).
/// The aggregator catches it and reports the source as unavailable.
class SourceException implements Exception {
  final String message;
  SourceException(this.message);
  @override
  String toString() => message;
}

/// One provider of open educational content, reached through its official,
/// public API. Implementations must:
///  - send [kUserAgent] with every request;
///  - return at most [kMaxPerSource] results;
///  - never scrape HTML pages, spoof a browser, bypass a block, or proxy media;
///  - only claim a licence the provider actually stated;
///  - throw [SourceException] on failure instead of returning made-up data.
abstract class OpenSource {
  /// Name shown to the student and used in error messages.
  String get name;

  Future<List<StudyResource>> search(String query, http.Client client);
}
