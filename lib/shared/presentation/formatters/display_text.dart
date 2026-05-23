String formatDisplayText(String value) {
  return value.replaceAll('_', ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
}

extension DisplayTextFormatting on String {
  String get displayText => formatDisplayText(this);
}
