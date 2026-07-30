import 'package:linkvault/features/add_link/domain/duplicate_bookmark_choice.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

typedef DuplicateChoiceRequest =
    Future<DuplicateBookmarkChoice?> Function(LinkWithTags existing);

class AddLinkSubmission {
  const AddLinkSubmission(this._repository);

  final AddLinkRepository _repository;

  Future<int?> create(
    LinkDraft draft, {
    AddLinkMetadata? metadata,
    required DuplicateChoiceRequest requestChoice,
  }) async {
    final duplicate = await _repository.findDuplicate(draft.url);
    if (duplicate == null) {
      return _repository.create(draft, metadata: metadata);
    }

    final choice = await requestChoice(duplicate);
    return switch (choice) {
      DuplicateBookmarkChoice.open => duplicate.link.id,
      DuplicateBookmarkChoice.saveAnyway => _repository.create(
        draft,
        metadata: metadata,
        allowDuplicate: true,
      ),
      DuplicateBookmarkChoice.merge => _merge(duplicate.link.id, draft),
      DuplicateBookmarkChoice.replace => _replace(
        duplicate.link.id,
        draft,
        metadata,
      ),
      null => null,
    };
  }

  Future<int> _merge(int id, LinkDraft draft) async {
    await _repository.mergeInto(id, draft);
    return id;
  }

  Future<int> _replace(
    int id,
    LinkDraft draft,
    AddLinkMetadata? metadata,
  ) async {
    await _repository.mergeInto(id, draft);
    if (metadata != null) await _repository.replaceMetadata(id, metadata);
    return id;
  }
}
