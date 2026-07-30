import 'package:linkvault/features/add_link/application/add_link_submission.dart';
import 'package:linkvault/features/add_link/repository/add_link_metadata_repository.dart';
import 'package:linkvault/features/add_link/repository/add_link_repository.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

class AddLinkSaveCoordinator {
  const AddLinkSaveCoordinator(this.repository);

  final AddLinkRepository repository;

  Future<int?> save({
    required LinkDraft draft,
    required AddLinkMetadata? metadata,
    required DuplicateChoiceRequest requestChoice,
    int? editingId,
  }) async {
    if (editingId == null) {
      return AddLinkSubmission(
        repository,
      ).create(draft, metadata: metadata, requestChoice: requestChoice);
    }
    await repository.update(editingId, draft, metadata: metadata);
    return editingId;
  }
}
