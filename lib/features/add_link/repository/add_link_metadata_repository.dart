import 'package:dio/dio.dart';

import 'package:linkvault/features/add_link/repository/html_metadata_parser.dart';
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
    this.canonicalUrl,
    this.contentType = 'webpage',
  });

  final String url;
  final String host;
  final String title;
  final String description;
  final String? imageUrl;
  final String? siteIconUrl;
  final String? readingTime;
  final String? canonicalUrl;
  final String contentType;
}

abstract interface class AddLinkMetadataRepository {
  Future<AddLinkMetadata> fetch(String rawUrl);
}

class DioAddLinkMetadataRepository implements AddLinkMetadataRepository {
  const DioAddLinkMetadataRepository(this._dio);

  final Dio _dio;
  static const _parser = HtmlMetadataParser();

  @override
  Future<AddLinkMetadata> fetch(String rawUrl) async {
    final url = normalizeUrl(rawUrl);
    final parsedUrl = Uri.parse(url);
    final host = _parser.displayHost(parsedUrl);
    final response = await _dio.get<String>(
      url,
      options: Options(
        responseType: ResponseType.plain,
        headers: const {'Accept': 'text/html'},
      ),
    );
    final body = response.data ?? '';
    final responseUrl = response.realUri;

    return AddLinkMetadata(
      url: url,
      host: host,
      title:
          _parser.metaProperty(body, 'og:title') ??
          _parser.metaProperty(body, 'twitter:title') ??
          _parser.title(body) ??
          host,
      description:
          _parser.metaProperty(body, 'og:description') ??
          _parser.metaName(body, 'description') ??
          '',
      imageUrl: _parser.resolveUrl(
        responseUrl,
        _parser.metaProperty(body, 'og:image') ??
            _parser.metaProperty(body, 'twitter:image'),
      ),
      siteIconUrl:
          _parser.resolveUrl(responseUrl, _parser.iconHref(body)) ??
          _parser.faviconUrl(responseUrl),
      readingTime: _parser.estimateReadingTime(body),
      canonicalUrl:
          _parser.resolveUrl(responseUrl, _parser.canonicalHref(body)) ??
          responseUrl.toString(),
      contentType: _parser.contentType(response.headers.value('content-type')),
    );
  }
}
