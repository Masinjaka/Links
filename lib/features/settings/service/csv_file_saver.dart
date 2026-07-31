import 'dart:convert';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

abstract interface class CsvFileSaver {
  Future<bool> save(String csv);
}

final class SystemCsvFileSaver implements CsvFileSaver {
  const SystemCsvFileSaver();

  @override
  Future<bool> save(String csv) async {
    final path = await FileSaver.instance.saveAs(
      name: 'rohy-links',
      bytes: Uint8List.fromList(utf8.encode(csv)),
      fileExtension: 'csv',
      mimeType: MimeType.csv,
    );
    return path != null;
  }
}
