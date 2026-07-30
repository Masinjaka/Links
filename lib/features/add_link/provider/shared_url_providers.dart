import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:linkvault/features/add_link/service/shared_url_service.dart';

part 'shared_url_providers.g.dart';

@Riverpod(keepAlive: true)
SharedUrlService sharedUrlService(Ref ref) {
  final service = SharedUrlService();
  ref.onDispose(service.dispose);
  return service;
}
