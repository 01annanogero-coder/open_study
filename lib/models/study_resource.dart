/// The kind of content a resource is, which decides how it is opened in-app.
enum ResourceType { pdf, video, article, unknown }

/// A single piece of free, openly-licensed (or free-to-read) study material.
///
/// Every resource must tell the student honestly where it came from and under
/// what terms it may be used: [source] names the provider, [license] is a short
/// human-readable label, and [licenseUrl] (when known) links to the licence text.
class StudyResource {
  final String id;
  final String title;

  /// Provider name shown to the student, e.g. "Internet Archive", "OpenStax".
  final String source;

  /// Short licence label, e.g. "CC BY 4.0", "CC0 1.0", "Free to read (arXiv)".
  /// Never claim a licence the provider did not state.
  final String license;

  /// Link to the licence text when the provider gave one.
  final String? licenseUrl;

  final ResourceType type;

  /// Page or file to open. Always the provider's own page or official embed.
  final String url;

  final String? thumbnailUrl;
  final String? description;

  /// Author, uploader or channel, used for attribution when available.
  final String? creator;

  const StudyResource({
    required this.id,
    required this.title,
    required this.source,
    required this.license,
    required this.type,
    required this.url,
    this.licenseUrl,
    this.thumbnailUrl,
    this.description,
    this.creator,
  });

  /// Stored form used by the on-device bookmarks list.
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'source': source,
        'license': license,
        'licenseUrl': licenseUrl,
        'type': type.name,
        'url': url,
        'thumbnailUrl': thumbnailUrl,
        'description': description,
        'creator': creator,
      };

  factory StudyResource.fromJson(Map<String, dynamic> json) => StudyResource(
        id: json['id'] as String,
        title: json['title'] as String,
        source: json['source'] as String,
        license: json['license'] as String,
        licenseUrl: json['licenseUrl'] as String?,
        type: ResourceType.values.firstWhere(
          (t) => t.name == json['type'],
          orElse: () => ResourceType.unknown,
        ),
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String?,
        description: json['description'] as String?,
        creator: json['creator'] as String?,
      );

  bool get isYouTube {
    final host = Uri.tryParse(url)?.host.toLowerCase() ?? '';
    return host == 'www.youtube.com' ||
        host == 'youtube.com' ||
        host == 'm.youtube.com' ||
        host == 'youtu.be';
  }
}

/// Result of a search: resources plus subcategory chips the student can tap
/// to narrow the query, and the names of any sources that did not respond.
class SearchResult {
  final List<String> subcategories;
  final List<StudyResource> resources;
  final List<String> failedSources;

  const SearchResult({
    required this.subcategories,
    required this.resources,
    this.failedSources = const [],
  });
}
