part of 'linkvault_test_harness.dart';

final class _FakeLinkDataRepository
    implements FeedRepository, AddLinkRepository, LinkDetailsRepository {
  final _knownTags = <Tag>[
    ...primaryLink.tags,
    Tag(id: 3, name: 'PERSISTED_DB', category: 'GENERAL', createdAt: createdAt),
    Tag(id: 4, name: 'ARCHIVE', category: 'GENERAL', createdAt: createdAt),
    Tag(id: 5, name: 'ARCHIVED', category: 'GENERAL', createdAt: createdAt),
  ];

  @override
  Stream<List<LinkWithTags>> watchLinks([FeedQuery query = const FeedQuery()]) {
    return Stream.value([primaryLink]);
  }

  @override
  Stream<List<Tag>> watchTags() => Stream.value(_knownTags);

  @override
  Stream<List<Collection>> watchCollections() => const Stream.empty();

  @override
  Stream<List<String>> watchContentTypes() => Stream.value(['webpage']);

  @override
  Stream<List<String>> watchDomains() => Stream.value(['manifesto.io']);

  @override
  Stream<LinkWithTags?> watchLink(int? linkId) => Stream.value(primaryLink);

  @override
  Stream<Collection?> watchCollection(int linkId) {
    return Stream.value(
      Collection(
        id: 1,
        title: 'WORK_PROJECTS',
        type: 'PRIVATE',
        iconKey: 'folder',
        tagName: 'UTILITY',
        isFavourite: false,
        isPinned: false,
        isArchived: false,
        createdAt: createdAt,
        updatedAt: updatedAt,
      ),
    );
  }

  @override
  Future<int> create(
    LinkDraft draft, {
    AddLinkMetadata? metadata,
    bool allowDuplicate = false,
  }) async {
    lastCreatedLinkDraft = draft;
    return 1;
  }

  @override
  Future<void> update(
    int id,
    LinkDraft draft, {
    AddLinkMetadata? metadata,
  }) async {}

  @override
  Future<void> ensureTagExists(String name) async {}

  @override
  Future<void> archiveLinks(Iterable<int> linkIds) async {}

  @override
  Future<void> archive(int id) async {}

  @override
  Future<void> deletePermanently(Iterable<int> linkIds) async {
    deletedArchivedLinkIds.addAll(linkIds);
  }

  @override
  Future<void> emptyTrash() async {}

  @override
  Future<LinkWithTags?> findDuplicate(String rawUrl, {int? excludingId}) async {
    return null;
  }

  @override
  Future<void> markOpened(int linkId) async {}

  @override
  Future<void> mergeInto(int id, LinkDraft draft) async {}

  @override
  Future<void> replaceMetadata(int id, AddLinkMetadata metadata) async {}

  @override
  Future<void> restoreLinks(Iterable<int> linkIds) async {
    restoredArchivedLinkIds.addAll(linkIds);
  }

  @override
  Future<void> setFavourite(Iterable<int> linkIds, bool value) async {}

  @override
  Future<void> setPinned(Iterable<int> linkIds, bool value) async {}

  @override
  Future<void> trashLinks(Iterable<int> linkIds) async {}

  @override
  Future<void> updateNote(int linkId, String note) async {}
}
