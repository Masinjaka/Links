part of 'linkvault_test_harness.dart';

final class _FakeCsvFileSaver implements CsvFileSaver {
  @override
  Future<bool> save(String csv) async {
    lastSavedCsv = csv;
    return true;
  }
}
