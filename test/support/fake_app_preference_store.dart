part of 'linkvault_test_harness.dart';

final class _FakeAppPreferenceStore implements AppPreferenceStore {
  final _values = <String, String>{};

  @override
  Future<String?> readString(String key) async => _values[key];

  @override
  Future<void> writeString(String key, String value) async {
    _values[key] = value;
  }
}
