List<List<String>> parseSettingsCsv(String input) {
  final rows = <List<String>>[];
  final currentRow = <String>[];
  final currentValue = StringBuffer();
  var inQuotes = false;

  for (var index = 0; index < input.length; index++) {
    final char = input[index];
    final next = index + 1 < input.length ? input[index + 1] : null;
    if (char == '"') {
      if (inQuotes && next == '"') {
        currentValue.write('"');
        index += 1;
      } else {
        inQuotes = !inQuotes;
      }
      continue;
    }
    if (char == ',' && !inQuotes) {
      currentRow.add(currentValue.toString());
      currentValue.clear();
      continue;
    }
    if ((char == '\n' || char == '\r') && !inQuotes) {
      if (char == '\r' && next == '\n') index += 1;
      currentRow.add(currentValue.toString());
      currentValue.clear();
      _addCsvRow(rows, currentRow);
      currentRow.clear();
      continue;
    }
    currentValue.write(char);
  }
  if (currentValue.isNotEmpty || currentRow.isNotEmpty) {
    currentRow.add(currentValue.toString());
    _addCsvRow(rows, currentRow);
  }
  return rows;
}

String? settingsCsvValueAt(List<String> row, int index) {
  if (index < 0 || index >= row.length) return null;
  final value = row[index].trim();
  return value.isEmpty ? null : value;
}

String escapeSettingsCsv(String value) {
  return '"${value.replaceAll('"', '""')}"';
}

void _addCsvRow(List<List<String>> rows, List<String> row) {
  if (row.any((cell) => cell.isNotEmpty)) rows.add(List<String>.from(row));
}
