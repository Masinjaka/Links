String? normalizeTagName(String rawValue) {
  final trimmed = rawValue.trim();
  if (trimmed.isEmpty) return null;
  final normalized = trimmed
      .replaceAll(RegExp(r'\s+'), '_')
      .replaceAll(RegExp(r'[^A-Za-z0-9_]+'), '')
      .toUpperCase();
  return normalized.isEmpty ? null : normalized;
}

const suggestedLinkTags = ['DESIGN', 'DEV', 'RESEARCH', 'ARCHIVE', 'UTILITY'];
