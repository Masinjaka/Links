import 'package:drift/drift.dart';

import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/add_link/domain/normalized_url.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';

Future<LinkWithTags> hydrateLink(AppDatabase db, Link link) async {
  final tagRows = await (db.select(db.linkTags).join([
    innerJoin(db.tags, db.tags.id.equalsExp(db.linkTags.tagId)),
  ])..where(db.linkTags.linkId.equals(link.id))).get();
  final preview = await (db.select(
    db.linkPreviews,
  )..where((tbl) => tbl.linkId.equals(link.id))).getSingleOrNull();

  return LinkWithTags(
    link: link,
    preview: preview,
    tags: [for (final row in tagRows) row.readTable(db.tags)],
  );
}

List<LinkWithTags> applyLinkFilters(
  List<LinkWithTags> links,
  LinkFilters filters,
) {
  final query = filters.query.trim().toLowerCase();

  return links
      .where((item) {
        final link = item.link;
        final matchesQuery =
            query.isEmpty ||
            link.title.toLowerCase().contains(query) ||
            link.url.toLowerCase().contains(query) ||
            link.domain.toLowerCase().contains(query) ||
            item.tags.any((tag) => tag.name.toLowerCase().contains(query));
        final matchesTag =
            filters.tag == null ||
            item.tags.any(
              (tag) => tag.name == filters.tag || tag.category == filters.tag,
            );
        final matchesDomain =
            filters.domains.isEmpty ||
            filters.domains.any(
              (domain) =>
                  link.domain.toUpperCase().contains(domain.toUpperCase()),
            );
        final matchesFrom =
            filters.from == null || !link.createdAt.isBefore(filters.from!);
        final matchesTo =
            filters.to == null || !link.createdAt.isAfter(filters.to!);

        return matchesQuery &&
            matchesTag &&
            matchesDomain &&
            matchesFrom &&
            matchesTo;
      })
      .toList(growable: false);
}

String normalizeUrl(String url) {
  return const UrlNormalizer().normalize(url).normalized;
}
