/// Licence label helpers for Open Study sources.
///
/// Only claim a licence the provider actually returned. Never invent labels.
library;

/// Returns a human-readable licence label from a Creative Commons or public
/// domain URL returned by a provider (e.g., Internet Archive).
///
/// Recognised patterns:
/// - `creativecommons.org/licenses/<type>/<version>/` → "CC BY 4.0" style
/// - `creativecommons.org/publicdomain/zero/1.0/` → "CC0 1.0"
/// - `creativecommons.org/publicdomain/mark/` → "Public Domain Mark"
/// - Anything else → "See licence"
String licenseLabelFromUrl(String url) {
  final lower = url.toLowerCase();

  // Creative Commons licences: /licenses/by/4.0/, /licenses/by-sa/3.0/, etc.
  final ccLicenseMatch = RegExp(
    r'creativecommons\.org/licenses/(by|by-sa|by-nc|by-nc-sa|by-nd|by-nc-nd)/([\d.]+)/?',
  ).firstMatch(lower);
  if (ccLicenseMatch != null) {
    final type = ccLicenseMatch.group(1)!;
    final version = ccLicenseMatch.group(2)!;
    final typeUpper = type
        .split('-')
        .map((part) => part.toUpperCase())
        .join('-');
    return 'CC $typeUpper $version';
  }

  // CC0
  if (lower.contains('creativecommons.org/publicdomain/zero/1.0')) {
    return 'CC0 1.0';
  }

  // Public Domain Mark
  if (lower.contains('creativecommons.org/publicdomain/mark')) {
    return 'Public Domain Mark';
  }

  return 'See licence';
}

/// Returns a human-readable licence label from an OpenAlex licence code.
///
/// Recognised codes (as returned by OpenAlex `best_oa_location.license`):
/// - `cc-by` → "CC BY"
/// - `cc-by-sa` → "CC BY-SA"
/// - `cc0` → "CC0"
/// - `public-domain` → "Public domain"
/// - `cc-by-nc` → "CC BY-NC"
/// - `cc-by-nc-sa` → "CC BY-NC-SA"
/// - `cc-by-nd` → "CC BY-ND"
/// - `cc-by-nc-nd` → "CC BY-NC-ND"
/// - Unknown code → "See licence"
String licenseLabelFromCode(String code) {
  switch (code.toLowerCase()) {
    case 'cc-by':
      return 'CC BY';
    case 'cc-by-sa':
      return 'CC BY-SA';
    case 'cc0':
      return 'CC0';
    case 'public-domain':
      return 'Public domain';
    case 'cc-by-nc':
      return 'CC BY-NC';
    case 'cc-by-nc-sa':
      return 'CC BY-NC-SA';
    case 'cc-by-nd':
      return 'CC BY-ND';
    case 'cc-by-nc-nd':
      return 'CC BY-NC-ND';
    default:
      return 'See licence';
  }
}