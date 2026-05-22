import 'package:dio/dio.dart';

import 'package:linkvault/features/feed/repository/link_repository_utils.dart';

class AddLinkMetadata {
  const AddLinkMetadata({
    required this.url,
    required this.host,
    required this.title,
    required this.description,
    this.imageUrl,
    this.siteIconUrl,
    this.readingTime,
  });

  final String url;
  final String host;
  final String title;
  final String description;
  final String? imageUrl;
  final String? siteIconUrl;
  final String? readingTime;
}

abstract interface class AddLinkMetadataRepository {
  Future<AddLinkMetadata> fetch(String rawUrl);
}

class DioAddLinkMetadataRepository implements AddLinkMetadataRepository {
  const DioAddLinkMetadataRepository(this._dio);

  final Dio _dio;

  @override
  Future<AddLinkMetadata> fetch(String rawUrl) async {
    final url = normalizeUrl(rawUrl);
    final parsedUrl = Uri.tryParse(url);
    final host = _displayHost(parsedUrl);
    final fallbackTitle = host.toUpperCase();

    if (parsedUrl == null || !parsedUrl.hasScheme) {
      return AddLinkMetadata(
        url: url,
        host: host,
        title: fallbackTitle,
        description: 'Saved local resource.',
        siteIconUrl: _highResolutionFaviconUrl(parsedUrl),
      );
    }

    try {
      final response = await _dio.get<String>(
        parsedUrl.toString(),
        options: Options(
          responseType: ResponseType.plain,
          headers: const {'Accept': 'text/html'},
        ),
      );
      final body = response.data ?? '';

      return AddLinkMetadata(
        url: url,
        host: host,
        title:
            _metaProperty(body, 'og:title') ??
            _metaProperty(body, 'twitter:title') ??
            _title(body) ??
            fallbackTitle,
        description:
            _metaProperty(body, 'og:description') ??
            _metaName(body, 'description') ??
            'Metadata captured from $host.',
        imageUrl: _resolveImageUrl(
          parsedUrl,
          _metaProperty(body, 'og:image') ??
              _metaProperty(body, 'twitter:image'),
        ),
        readingTime: _estimateReadingTime(body),
        siteIconUrl:
            _resolveImageUrl(parsedUrl, _iconHref(body)) ??
            _highResolutionFaviconUrl(parsedUrl),
      );
    } on DioException {
      return AddLinkMetadata(
        url: url,
        host: host,
        title: fallbackTitle,
        description: 'Network preview unavailable. Metadata will sync later.',
        siteIconUrl: _highResolutionFaviconUrl(parsedUrl),
      );
    }
  }

  String _displayHost(Uri? parsedUrl) {
    final host = parsedUrl?.host.trim();
    if (host == null || host.isEmpty) {
      return 'local';
    }

    return host;
  }

  String? _title(String html) {
    final match = RegExp(
      r'<title[^>]*>(.*?)</title>',
      caseSensitive: false,
      dotAll: true,
    ).firstMatch(html);

    return _clean(match?.group(1));
  }

  String? _metaProperty(String html, String property) {
    return _metaValue(html, attribute: 'property', value: property);
  }

  String? _metaName(String html, String name) {
    return _metaValue(html, attribute: 'name', value: name);
  }

  String? _metaValue(
    String html, {
    required String attribute,
    required String value,
  }) {
    final escapedAttribute = RegExp.escape(attribute);
    final escapedValue = RegExp.escape(value);
    final patterns = [
      '<meta[^>]+$escapedAttribute=["\\\']$escapedValue["\\\'][^>]+content=["\\\']([^"\\\']+)["\\\'][^>]*>',
      '<meta[^>]+content=["\\\']([^"\\\']+)["\\\'][^>]+$escapedAttribute=["\\\']$escapedValue["\\\'][^>]*>',
    ];

    for (final pattern in patterns) {
      final match = RegExp(pattern, caseSensitive: false).firstMatch(html);
      final cleaned = _clean(match?.group(1));
      if (cleaned != null) {
        return cleaned;
      }
    }

    return null;
  }

  String? _resolveImageUrl(Uri baseUrl, String? imageUrl) {
    final cleaned = _clean(imageUrl);
    if (cleaned == null) {
      return null;
    }

    final parsedImage = Uri.tryParse(cleaned);
    if (parsedImage == null) {
      return null;
    }

    return parsedImage.hasScheme
        ? parsedImage.toString()
        : baseUrl.resolveUri(parsedImage).toString();
  }

  String? _iconHref(String html) {
    final match = RegExp(
      '<link[^>]+rel=["\\\']([^"\\\']*(?:icon|apple-touch-icon)[^"\\\']*)["\\\'][^>]+href=["\\\']([^"\\\']+)["\\\'][^>]*>',
      caseSensitive: false,
    ).firstMatch(html);

    return _clean(match?.group(2));
  }

  String? _highResolutionFaviconUrl(Uri? parsedUrl) {
    if (parsedUrl == null || !parsedUrl.hasScheme || parsedUrl.host.isEmpty) {
      return null;
    }

    return Uri.https('www.google.com', '/s2/favicons', {
      'domain': parsedUrl.host,
      'sz': '128',
    }).toString();
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

  String? _estimateReadingTime(String html) {
    final withoutScripts = html.replaceAll(
      RegExp(r'<script[\s\S]*?</script>', caseSensitive: false),
      ' ',
    );
    final withoutStyles = withoutScripts.replaceAll(
      RegExp(r'<style[\s\S]*?</style>', caseSensitive: false),
      ' ',
    );
    final plainText = withoutStyles
        .replaceAll(RegExp(r'<[^>]+>'), ' ')
        .replaceAll(RegExp(r'&nbsp;?', caseSensitive: false), ' ')
        .replaceAll(RegExp(r'&[a-zA-Z#0-9]+;'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();

    if (plainText.isEmpty) {
      return null;
    }

    final words = plainText
        .split(RegExp(r'\s+'))
        .where((word) => word.trim().isNotEmpty)
        .length;
    if (words < 80) {
      return null;
    }

    final minutes = (words / 200).ceil().clamp(1, 99);
    return 'READ_${minutes}_MIN';
  }
}
