import 'dart:async';

import 'package:flutter/services.dart';

import 'package:linkvault/features/add_link/service/shared_url_service.dart';

final class TestSharedUrlService extends SharedUrlService {
  TestSharedUrlService.pending()
    : _initialUrl = Completer<String?>(),
      super(channel: const MethodChannel('test/share_intake'));

  TestSharedUrlService.resolved(String? initialUrl)
    : _initialUrl = (Completer<String?>()..complete(initialUrl)),
      super(channel: const MethodChannel('test/share_intake'));

  final Completer<String?> _initialUrl;

  void complete(String? url) => _initialUrl.complete(url);

  @override
  Future<String?> takeInitialUrl() => _initialUrl.future;
}
