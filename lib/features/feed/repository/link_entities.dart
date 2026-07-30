import 'package:linkvault/core/database/app_database.dart';

class LinkWithTags {
  const LinkWithTags({
    required this.link,
    required this.preview,
    required this.tags,
  });

  final Link link;
  final LinkPreview? preview;
  final List<Tag> tags;

  String get primaryTag => tags.isEmpty ? 'UNTAGGED' : tags.first.name;
  String get savedDate =>
      '${link.createdAt.month.toString().padLeft(2, '0')}.${link.createdAt.day.toString().padLeft(2, '0')}';
}

class LinkDraft {
  const LinkDraft({
    required this.url,
    this.title,
    this.description,
    this.note,
    this.tags = const [],
    this.collectionIds = const [],
  });

  final String url;
  final String? title;
  final String? description;
  final String? note;
  final List<String> tags;
  final List<int> collectionIds;
}

extension LinkDisplayFields on Link {
  String get displayUrl => originalUrl.isEmpty ? url : originalUrl;
}

class LinkFilters {
  const LinkFilters({
    this.query = '',
    this.tag,
    this.domains = const [],
    this.from,
    this.to,
  });

  final String query;
  final String? tag;
  final List<String> domains;
  final DateTime? from;
  final DateTime? to;
}
