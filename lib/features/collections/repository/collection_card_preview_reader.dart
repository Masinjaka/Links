import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';

typedef CollectionCardData = ({
  int count,
  List<String?> imageUrls,
  String description,
});

Map<int, CollectionCardData> buildCollectionCardData(
  AppDatabase db,
  Iterable<TypedResult> rows,
) {
  final result = <int, CollectionCardData>{};

  for (final row in rows) {
    final membership = row.readTableOrNull(db.collectionLinks);
    if (membership == null) continue;
    final collectionId = membership.collectionId;
    final current = result[collectionId];
    final link = row.readTableOrNull(db.links);
    final preview = row.readTableOrNull(db.linkPreviews);
    final imageUrls = [...?current?.imageUrls];
    if (imageUrls.length < 3) {
      imageUrls.add(_previewImageUrl(link, preview));
    }
    result[collectionId] = (
      count: (current?.count ?? 0) + 1,
      imageUrls: imageUrls,
      description: current?.description.isNotEmpty == true
          ? current!.description
          : _description(link, preview),
    );
  }
  return result;
}

String? _previewImageUrl(Link? link, LinkPreview? preview) {
  final url = preview?.imageUrl ?? link?.sourceImageUrl;
  return url?.trim().isEmpty == true ? null : url;
}

String _description(Link? link, LinkPreview? preview) {
  if (link == null) return '';
  if (link.note.trim().isNotEmpty) return link.note.trim();
  if (preview?.previewDescription.trim().isNotEmpty == true) {
    return preview!.previewDescription.trim();
  }
  return link.description;
}
