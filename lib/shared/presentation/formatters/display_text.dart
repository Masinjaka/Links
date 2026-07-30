String formatDisplayText(String value) {
  return value.replaceAll('_', ' ').replaceAll(RegExp(r'\s+'), ' ').trim();
}

extension DisplayTextFormatting on String {
  String get displayText => formatDisplayText(this);

  String get lowerDisplayText => formatDisplayText(toLowerCase());

  String get sentenceDisplayText {
    final value = lowerDisplayText;
    if (value.isEmpty) return value;
    return '${value[0].toUpperCase()}${value.substring(1)}';
  }
}
