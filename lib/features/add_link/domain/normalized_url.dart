import 'dart:convert';

class NormalizedUrl {
  const NormalizedUrl({
    required this.original,
    required this.normalized,
    required this.hash,
    required this.domain,
  });

  final String original;
  final String normalized;
  final String hash;
  final String domain;
}

class UrlNormalizer {
  const UrlNormalizer();

  static const _trackingKeys = {
    'fbclid',
    'gclid',
    'dclid',
    'msclkid',
    'mc_cid',
    'mc_eid',
  };

  NormalizedUrl normalize(String rawUrl) {
    final original = rawUrl.trim();
    if (original.isEmpty || RegExp(r'\s').hasMatch(original)) {
      throw const FormatException('Enter a valid web address.');
    }
    final withScheme = _withScheme(original);
    final parsed = Uri.tryParse(withScheme);
    if (parsed == null || parsed.host.isEmpty) {
      throw const FormatException('Enter a valid web address.');
    }

    final host = _normalizeHost(parsed.host);
    final query = <String, List<String>>{};
    final keys = parsed.queryParametersAll.keys.toList()..sort();
    for (final key in keys) {
      final lowered = key.toLowerCase();
      if (lowered.startsWith('utm_') || _trackingKeys.contains(lowered)) {
        continue;
      }
      query[key] = parsed.queryParametersAll[key]!;
    }

    final path = _normalizePath(parsed.path);
    final normalized = Uri(
      scheme: 'https',
      host: host,
      port: _normalizedPort(parsed),
      path: path,
      queryParameters: query.isEmpty ? null : query,
    ).toString();

    return NormalizedUrl(
      original: original,
      normalized: normalized,
      hash: _stableHash(normalized),
      domain: host,
    );
  }

  String _withScheme(String value) {
    final lower = value.toLowerCase();
    return lower.startsWith('http://') || lower.startsWith('https://')
        ? value
        : 'https://$value';
  }

  String _normalizeHost(String host) {
    final lowered = host.toLowerCase();
    if (lowered.startsWith('www.')) return lowered.substring(4);
    if (lowered.startsWith('m.')) return lowered.substring(2);
    if (lowered.startsWith('mobile.')) return lowered.substring(7);
    return lowered;
  }

  int? _normalizedPort(Uri uri) {
    if (!uri.hasPort) return null;
    if (uri.port == 80 || uri.port == 443) return null;
    return uri.port;
  }

  String _normalizePath(String path) {
    if (path.isEmpty || path == '/') return '';
    return path.endsWith('/') ? path.substring(0, path.length - 1) : path;
  }

  String _stableHash(String value) {
    var hash = 0x811c9dc5;
    for (final byte in utf8.encode(value)) {
      hash ^= byte;
      hash = (hash * 0x01000193) & 0xffffffff;
    }
    return hash.toRadixString(16).padLeft(8, '0');
  }
}

String? bookmarkUrlError(String value) {
  try {
    const UrlNormalizer().normalize(value);
    return null;
  } on FormatException catch (error) {
    return error.message;
  }
}
