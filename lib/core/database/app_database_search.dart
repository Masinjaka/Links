part of 'app_database.dart';

extension AppDatabaseSearch on AppDatabase {
  Future<void> _ensureSearchSchema() async {
    await customStatement('''
      CREATE VIRTUAL TABLE IF NOT EXISTS link_search USING fts5(
        bookmark_id UNINDEXED,
        title,
        original_url,
        normalized_url,
        domain,
        description,
        note,
        tags,
        collections,
        cached_text
      )
    ''');
    await rebuildSearchIndex();
  }

  Future<void> rebuildSearchIndex() async {
    await transaction(() async {
      await customStatement('DELETE FROM link_search');
      final ids = await customSelect('SELECT id FROM links').get();
      for (final row in ids) {
        await refreshSearchEntry(row.read<int>('id'));
      }
    });
  }

  Future<void> refreshSearchEntry(int bookmarkId) async {
    await customStatement('DELETE FROM link_search WHERE bookmark_id = ?', [
      bookmarkId,
    ]);
    await customStatement(
      '''
      INSERT INTO link_search (
        bookmark_id, title, original_url, normalized_url, domain,
        description, note, tags, collections, cached_text
      )
      SELECT
        l.id,
        l.title,
        l.original_url,
        l.normalized_url,
        l.domain,
        l.description,
        l.note,
        COALESCE((
          SELECT group_concat(t.name, ' ')
          FROM link_tags lt
          JOIN tags t ON t.id = lt.tag_id
          WHERE lt.link_id = l.id
        ), ''),
        COALESCE((
          SELECT group_concat(c.title, ' ')
          FROM collection_links cl
          JOIN collections c ON c.id = cl.collection_id
          WHERE cl.link_id = l.id
        ), ''),
        COALESCE((
          SELECT s.text_content
          FROM bookmark_snapshots s
          WHERE s.bookmark_id = l.id
        ), '')
      FROM links l
      WHERE l.id = ?
      ''',
      [bookmarkId],
    );
  }
}
