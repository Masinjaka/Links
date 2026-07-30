class HtmlMetadataParser {
  const HtmlMetadataParser();

  String displayHost(Uri uri) {
    final host = uri.host.trim();
    return host.isEmpty ? 'local' : host;
  }

  String? title(String html) {
    final match = RegExp(
      r'<title[^>]*>(.*?)</title>',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(html);
    return _clean(match?.group(1));
  }

  String? metaProperty(String html, String property) {
    return _metaValue(html, attribute: 'property', value: property);
  }

  String? metaName(String html, String name) {
    return _metaValue(html, attribute: 'name', value: name);
  }

  String? iconHref(String html) {
    final match = RegExp(
      '<link[^>]+rel=["\\\']([^"\\\']*(?:icon|apple-touch-icon)'
      '[^"\\\']*)["\\\'][^>]+href=["\\\']([^"\\\']+)["\\\'][^>]*>',
      caseSensitive: false,
    ).firstMatch(html);
    return _clean(match?.group(2));
  }

  String? canonicalHref(String html) {
    final match = RegExp(
      '<link[^>]+rel=["\\\'][^"\\\']*canonical[^"\\\']*["\\\']'
      '[^>]+href=["\\\']([^"\\\']+)["\\\'][^>]*>',
      caseSensitive: false,
    ).firstMatch(html);
    return _clean(match?.group(1));
  }

  String? resolveUrl(Uri baseUrl, String? value) {
    final cleaned = _clean(value);
    if (cleaned == null) return null;
    final parsed = Uri.tryParse(cleaned);
    if (parsed == null) return null;
    return parsed.hasScheme
        ? parsed.toString()
        : baseUrl.resolveUri(parsed).toString();
  }

  String? faviconUrl(Uri uri) {
    if (!uri.hasScheme || uri.host.isEmpty) return null;
    return Uri.https('www.google.com', '/s2/favicons', {
      'domain': uri.host,
      'sz': '128',
    }).toString();
  }

  String contentType(String? header) {
    final value = header?.toLowerCase() ?? '';
    if (value.contains('application/pdf')) return 'pdf';
    if (value.contains('image/')) return 'image';
    if (value.contains('video/')) return 'video';
    if (value.contains('audio/')) return 'audio';
    return 'webpage';
  }

  String? estimateReadingTime(String html) {
    final text = html
        .replaceAll(
          RegExp(r'<script[\s\S]*?</script>', caseSensitive: false),
          ' ',
        )
        .replaceAll(
          RegExp(r'<style[\s\S]*?</style>', caseSensitive: false),
          ' ',
        )
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'&[a-zA-Z#0-9]+;'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
    if (text.isEmpty) return null;
    final words = text.split(' ').where((word) => word.isNotEmpty).length;
    if (words < 80) return null;
    return 'READ_${(words / 200).ceil().clamp(1, 99)}_MIN';
  }

  String? _metaValue(
    String html, {
    required String attribute,
    required String value,
  }) {
    final escapedAttribute = RegExp.escape(attribute);
    final escapedValue = RegExp.escape(value);
    final patterns = [
      '<meta[^>]+$escapedAttribute=["\\\']$escapedValue["\\\']'
          '[^>]+content=["\\\']([^"\\\']+)["\\\'][^>]*>',
      '<meta[^>]+content=["\\\']([^"\\\']+)["\\\'][^>]+'
          '$escapedAttribute=["\\\']$escapedValue["\\\'][^>]*>',
    ];
    for (final pattern in patterns) {
      final match = RegExp(pattern, caseSensitive: false).firstMatch(html);
      final value = _clean(match?.group(1));
      if (value != null) return value;
    }
    return null;
  }

  String? _clean(String? value) {
    final cleaned = value
        ?.replaceAll(RegExp(r'\s+'), ' ')
        .replaceAll('&amp;', '&')
        .replaceAll('&quot;', '"')
        .replaceAll('&#39;', "'")
        .trim();
    return cleaned == null || cleaned.isEmpty ? null : cleaned;
  }
}
