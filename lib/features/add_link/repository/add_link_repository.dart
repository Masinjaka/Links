import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/core/database/app_database.dart';

abstract interface class AddLinkRepository {
  Future<int> create(
    LinkDraft draft, {
    AddLinkMetadata? metadata,
    bool allowDuplicate = false,
  });
  Future<void> update(int id, LinkDraft draft, {AddLinkMetadata? metadata});
  Future<LinkWithTags?> findDuplicate(String rawUrl, {int? excludingId});
  Future<void> mergeInto(int id, LinkDraft draft);
  Future<void> replaceMetadata(int id, AddLinkMetadata metadata);
  Stream<List<Tag>> watchTags();
  Stream<LinkWithTags?> watchLink(int id);
  Future<void> ensureTagExists(String name);
}

class DuplicateBookmarkException implements Exception {
  const DuplicateBookmarkException(this.existing);

  final LinkWithTags existing;
}
