import 'dart:async';

import 'package:flutter/services.dart';

class SharedUrlService {
  SharedUrlService({
    MethodChannel channel = const MethodChannel('linkvault/share_intake'),
  }) : _channel = channel {
    _channel.setMethodCallHandler(_handleMethod);
  }

  final MethodChannel _channel;
  final _sharedUrls = StreamController<String>.broadcast();

  Stream<String> get sharedUrls => _sharedUrls.stream;

  Future<String?> takeInitialUrl() async {
    try {
      final value = await _channel.invokeMethod<String>('takeSharedUrl');
      return _validUrl(value);
    } on MissingPluginException {
      return null;
    }
  }

  Future<void> dispose() async {
    _channel.setMethodCallHandler(null);
    await _sharedUrls.close();
  }

  Future<void> _handleMethod(MethodCall call) async {
    if (call.method != 'sharedUrl') return;
    final url = _validUrl(call.arguments as String?);
    if (url != null) _sharedUrls.add(url);
  }

  String? _validUrl(String? value) {
    final trimmed = value?.trim();
    return trimmed == null || trimmed.isEmpty ? null : trimmed;
  }
}
