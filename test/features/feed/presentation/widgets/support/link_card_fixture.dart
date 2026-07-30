import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

LinkWithTags linkCardFixture(DateTime createdAt, {String? imageUrl}) {
  return LinkWithTags(
    link: Link(
      id: 1,
      title: 'UPPERCASE LINK TITLE',
      url: 'https://www.example.com/reference/path?source=test',
      originalUrl: 'https://www.example.com/reference/path?source=test',
      normalizedUrl: 'https://example.com/reference/path?source=test',
      urlHash: 'fixture',
      domain: 'example.com',
      description: '',
      note: '',
      sourceImageUrl: null,
      readingTime: '',
      contentType: 'webpage',
      status: 'active',
      isFavourite: false,
      isPinned: false,
      isArchived: false,
      metadataStatus: 'completed',
      offlineStatus: 'unavailable',
      linkHealthStatus: 'unknown',
      manualSortOrder: 0,
      createdAt: createdAt,
      updatedAt: createdAt,
    ),
    preview: LinkPreview(
      id: 1,
      linkId: 1,
      previewTitle: 'UPPERCASE LINK TITLE',
      previewDescription: '',
      imageUrl: imageUrl,
      imageLabel: 'preview.jpg',
      imageDimensions: '1200 x 630',
      fetchedAt: createdAt,
    ),
    tags: [
      Tag(id: 1, name: 'UI_DESIGN', category: 'GENERAL', createdAt: createdAt),
      Tag(id: 2, name: 'RESEARCH', category: 'GENERAL', createdAt: createdAt),
    ],
  );
}
