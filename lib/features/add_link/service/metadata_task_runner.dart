import 'dart:async';

import 'package:linkvault/features/add_link/repository/metadata_task_processor.dart';

class MetadataTaskRunner {
  MetadataTaskRunner(this._processor);

  MetadataTaskRunner.disabled() : _processor = null;

  final MetadataTaskProcessor? _processor;
  Timer? _timer;

  void start() {
    if (_timer != null) return;
    unawaited(trigger());
    _timer = Timer.periodic(
      const Duration(minutes: 1),
      (_) => unawaited(trigger()),
    );
  }

  Future<void> trigger() {
    return _processor?.processDueTasks() ?? Future.value();
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
