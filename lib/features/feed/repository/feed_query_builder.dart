import 'package:drift/drift.dart';

import 'package:linkvault/features/feed/domain/bookmark_state.dart';
import 'package:linkvault/features/feed/domain/feed_query.dart';

class FeedSqlQuery {
  const FeedSqlQuery(this.sql, this.variables);

  final String sql;
  final List<Variable<Object>> variables;
}

class FeedQueryBuilder {
  const FeedQueryBuilder();

  FeedSqlQuery build(FeedQuery query) {
    final where = <String>[];
    final variables = <Variable<Object>>[];
    _addScope(query.scope, where);
    _addSearch(query.text, where, variables);
    _addValue('l.domain', query.domain, where, variables);
    _addValue('l.content_type', query.contentType, where, variables);
    _addBool('l.is_favourite', query.favourite, where, variables);
    if (query.availableOffline != null) {
      _addValue(
        'l.offline_status',
        query.availableOffline! ? 'available' : 'unavailable',
        where,
        variables,
      );
    }
    if (query.broken != null) {
      _addValue(
        'l.link_health_status',
        query.broken! ? 'broken' : 'valid',
        where,
        variables,
      );
    }
    _addDate('l.created_at >= ?', query.addedFrom, where, variables);
    _addDate('l.created_at <= ?', query.addedTo, where, variables);
    _addRelationshipFilters(query, where, variables);

    return FeedSqlQuery(
      'SELECT DISTINCT l.id FROM links l '
      '${where.isEmpty ? '' : 'WHERE ${where.join(' AND ')}'} '
      'ORDER BY ${_sort(query.sort)}',
      variables,
    );
  }

  void _addScope(BookmarkScope scope, List<String> where) {
    where.add(switch (scope) {
      BookmarkScope.library => "l.status IN ('active', 'inbox')",
      BookmarkScope.inbox => "l.status = 'inbox'",
      BookmarkScope.active => "l.status = 'active'",
      BookmarkScope.archived => "l.status = 'archived'",
      BookmarkScope.trashed => "l.status = 'trashed'",
      BookmarkScope.all => '1 = 1',
    });
  }

  void _addSearch(
    String text,
    List<String> where,
    List<Variable<Object>> variables,
  ) {
    final terms = text
        .trim()
        .split(RegExp(r'\s+'))
        .where((term) => term.isNotEmpty)
        .map((term) => '"${term.replaceAll('"', '""')}"*')
        .join(' ');
    if (terms.isEmpty) return;
    where.add(
      'l.id IN (SELECT bookmark_id FROM link_search WHERE link_search MATCH ?)',
    );
    variables.add(Variable<String>(terms));
  }

  void _addRelationshipFilters(
    FeedQuery query,
    List<String> where,
    List<Variable<Object>> variables,
  ) {
    if (query.tag != null) {
      where.add(
        'EXISTS (SELECT 1 FROM link_tags lt JOIN tags t ON t.id = lt.tag_id '
        'WHERE lt.link_id = l.id AND t.name = ?)',
      );
      variables.add(Variable<String>(query.tag!));
    }
    if (query.collectionId != null) {
      where.add(
        'EXISTS (SELECT 1 FROM collection_links cl '
        'WHERE cl.link_id = l.id AND cl.collection_id = ?)',
      );
      variables.add(Variable<int>(query.collectionId!));
    }
  }

  void _addValue(
    String column,
    String? value,
    List<String> where,
    List<Variable<Object>> variables,
  ) {
    if (value == null) return;
    where.add('$column = ?');
    variables.add(Variable<String>(value));
  }

  void _addBool(
    String column,
    bool? value,
    List<String> where,
    List<Variable<Object>> variables,
  ) {
    if (value == null) return;
    where.add('$column = ?');
    variables.add(Variable<int>(value ? 1 : 0));
  }

  void _addDate(
    String clause,
    DateTime? value,
    List<String> where,
    List<Variable<Object>> variables,
  ) {
    if (value == null) return;
    where.add(clause);
    variables.add(Variable<DateTime>(value));
  }

  String _sort(FeedSort sort) {
    return switch (sort) {
      FeedSort.recentlyAdded => 'l.created_at DESC',
      FeedSort.oldest => 'l.created_at ASC',
      FeedSort.recentlyUpdated => 'l.updated_at DESC',
      FeedSort.recentlyOpened => 'l.last_opened_at DESC, l.created_at DESC',
      FeedSort.alphabetical => 'l.title COLLATE NOCASE ASC',
      FeedSort.domain => 'l.domain COLLATE NOCASE ASC, l.title ASC',
      FeedSort.manual => 'l.manual_sort_order ASC, l.created_at DESC',
    };
  }
}
