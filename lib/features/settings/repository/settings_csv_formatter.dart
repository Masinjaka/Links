String escapeSettingsCsv(String value) {
  return '"${value.replaceAll('"', '""')}"';
}
