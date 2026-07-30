# AI Agent Prompt: Offline-First Bookmarking Mobile App

## Role

You are a senior Flutter developer and offline-first mobile architect. Your task is to extend an existing bookmarking mobile application with the essential features described below while preserving its current behaviour.

## Existing Features

The application already supports:

- Saving links
- Link tagging
- Collections
- Multi-selection
- Editing bookmarks
- Deleting bookmarks

The next planned features are archiving and import/export.

## Primary Goal

Build a reliable offline-first bookmarking application where:

- Saving a link is instant.
- Core library management works without internet access.
- Remote metadata fetching never blocks local writes.
- Search remains fast as the bookmark library grows.
- Users can back up, restore and export all their data.
- Background tasks are retryable and resilient.

## Essential Features

### 1. Fast Link Capture

Implement:

- Android and iOS share-sheet support.
- Manual URL entry.
- Optional clipboard URL detection.
- An Inbox or Unorganised destination for links saved without tags or collections.
- Immediate local persistence before any network request.

Acceptance criteria:

- A shared URL is saved with no more than one confirmation action.
- Saving succeeds while offline.
- A failed metadata request does not roll back the bookmark.
- Duplicate checking runs before creating a new bookmark.

### 2. Offline Search, Filtering and Sorting

Search across:

- Title
- Original URL
- Normalised URL
- Domain
- Description
- Notes
- Tags
- Collection names
- Locally cached page text

Provide filters for:

- Tag
- Collection
- Domain
- Content type
- Favourite
- Archived
- Inbox
- Available offline
- Broken links
- Date added

Provide sorting by:

- Recently added
- Oldest
- Recently updated
- Recently opened
- Alphabetical
- Domain
- Manual order

Implementation guidance:

- Use SQLite full-text search, preferably FTS5.
- Do not load the complete bookmark table into memory for search.
- Keep the full-text index synchronised through database triggers or repository-level transactions.

### 3. Automatic Metadata Extraction

Fetch and store:

- Page title
- Description
- Domain
- Favicon
- Preview image
- Content type
- Canonical URL

Requirements:

- Metadata fields remain editable.
- Metadata fetching uses a retryable background task.
- Store task status, attempt count, next retry time and last error.
- Use exponential backoff.
- Respect redirects and update the canonical URL without overwriting the original URL.

### 4. Inbox, Favourites, Pinning and Archiving

Support the following distinct states:

- Inbox: saved but not organised.
- Active: part of the normal library.
- Archived: hidden from active views but retained.
- Trashed: soft-deleted and restorable.

Also support independent flags:

- Favourite
- Pinned

Do not model favourite and archived as mutually exclusive.

### 5. Personal Notes

Allow one editable note per bookmark.

Requirements:

- Notes work fully offline.
- Notes are included in full-text search.
- Updating a note updates the bookmark modification timestamp.
- Design the schema so highlights and annotations can be added later without changing the bookmark table significantly.

### 6. Duplicate Detection and URL Normalisation

Normalise URLs before duplicate comparison.

Handle:

- HTTP versus HTTPS
- Trailing slashes
- Fragments
- Tracking parameters such as `utm_*`
- Common mobile URL variants
- Hostname casing
- Default ports
- Canonical URL metadata

Store:

- Original URL
- Normalised URL
- Canonical URL
- Stable URL hash

When a duplicate is found, offer:

- Open existing bookmark
- Save anyway
- Merge tags and collections
- Replace existing metadata

Do not merge records automatically without user confirmation.

### 7. Trash and Undo

Implement soft deletion.

Requirements:

- Deleting moves a bookmark to Trash.
- Show an immediate undo action.
- Trash supports restore, permanent deletion and empty Trash.
- Multi-selection deletion uses the same behaviour.
- Optional automatic cleanup may remove items older than a configurable retention period.
- Associated notes, relationships and snapshots must be restorable until permanent deletion.

### 8. Import, Export, Backup and Restore

Support:

- Browser bookmark HTML import.
- CSV import and export.
- A complete versioned JSON or ZIP backup.
- Exporting selected bookmarks.
- Full-library restore.

The complete backup must preserve:

- Bookmarks
- Tags
- Collections
- Many-to-many relationships
- Notes
- Favourite and pinned flags
- Lifecycle status
- Creation and modification timestamps
- Optional thumbnails, cached pages and attachments

Requirements:

- Include a `schemaVersion` in every full backup.
- Validate input before modifying the database.
- Restore inside a database transaction.
- Define duplicate handling during import.
- Report skipped and failed records.
- Do not silently discard unknown fields from newer backup versions.

### 9. Offline Page Copies

Clearly distinguish:

- Bookmark metadata available offline.
- Page content downloaded for offline reading.

Implement an explicit **Make available offline** action.

Possible snapshot formats:

- Simplified article text
- HTML
- Screenshot
- PDF

Track:

- Download status
- Local path
- File size
- Checksum
- Snapshot format
- Creation and update timestamps
- Last error

Requirements:

- Users can delete a local snapshot without deleting the bookmark.
- Show total storage consumption.
- Avoid downloading every page automatically.
- Download tasks must resume or retry safely.

### 10. Broken-Link Management

Check links only when connectivity is available.

Statuses:

- Unknown
- Valid
- Redirected
- Broken
- Authentication required
- Check failed

Requirements:

- Link checking is user-triggered or scheduled conservatively.
- Do not delete broken bookmarks.
- Keep notes and offline snapshots when the remote resource disappears.
- Store the last check timestamp and response status where useful.

### 11. Bulk Actions

For selected bookmarks, support:

- Add and remove tags
- Move to or add to collections
- Archive and unarchive
- Favourite and unfavourite
- Pin and unpin
- Download offline copies
- Remove offline copies
- Move to Trash
- Export selected bookmarks

All bulk database changes should be transactional.

## Recommended Data Model

### Bookmark

```text
id
originalUrl
normalizedUrl
canonicalUrl
urlHash
title
description
note
domain
faviconPath
thumbnailPath
contentType
status
isFavourite
isPinned
metadataStatus
offlineStatus
linkHealthStatus
createdAt
updatedAt
lastOpenedAt
archivedAt
deletedAt
metadataFetchedAt
linkCheckedAt
manualSortOrder
```

Suggested enums:

```text
BookmarkStatus:
  inbox
  active
  archived
  trashed

MetadataStatus:
  pending
  fetching
  completed
  failed

OfflineStatus:
  unavailable
  queued
  downloading
  available
  failed

LinkHealthStatus:
  unknown
  valid
  redirected
  broken
  authenticationRequired
  failed
```

### Relationships

```text
BookmarkTag
  bookmarkId
  tagId

BookmarkCollection
  bookmarkId
  collectionId
  addedAt
  sortOrder
```

Use composite primary keys or unique constraints to prevent duplicate relationships.

### Bookmark Snapshot

```text
id
bookmarkId
format
localPath
textContent
checksum
fileSize
createdAt
updatedAt
lastError
```

### Pending Task

```text
id
bookmarkId
taskType
status
attemptCount
nextRetryAt
lastError
createdAt
updatedAt
```

Suggested task types:

```text
fetchMetadata
downloadPage
checkLink
generateThumbnail
rebuildSearchIndex
```

## Architecture Requirements

Use a layered architecture:

```text
Presentation
Application / Use Cases
Domain
Data / Repositories
Local Database
Background Task Runner
Network and Parsing Services
```

Rules:

- Widgets must not access SQLite directly.
- Repositories are the source of truth.
- Local storage is authoritative for the UI.
- Network operations update local state after completion.
- Use database transactions for relationship and bulk changes.
- Keep platform share-sheet code behind an abstraction.
- Add migrations for every schema change.
- Ensure migrations are reversible during development and covered by tests.
- Avoid making cloud sync a dependency for current features.

## Suggested Implementation Order

1. Share-sheet capture and Inbox.
2. Full-text search, filters and sorting.
3. Metadata extraction and background retry queue.
4. Favourites, pinning, notes and Trash.
5. URL normalisation and duplicate handling.
6. Archiving and complete bulk actions.
7. Import, export, backup and restore.
8. Offline page snapshots.
9. Broken-link checking.

Complete each phase with migrations, repository methods, state management, UI states and tests before beginning the next phase.

## Testing Requirements

Add tests for:

- URL normalisation.
- Duplicate detection.
- Bookmark lifecycle transitions.
- Undo and restore.
- Search-index updates.
- Import validation.
- Backup round trips.
- Relationship preservation.
- Background retry behaviour.
- Failed metadata fetches.
- Offline snapshot removal.
- Bulk-action transactions.
- Database migrations.

Include:

- Unit tests for domain and services.
- Repository integration tests against a real test database.
- Widget tests for important states.
- Platform integration tests for share-sheet capture where practical.

## Definition of Done

A feature is complete only when:

- It works without internet where applicable.
- Loading, empty, success and error states are implemented.
- Database migrations are included.
- Repository and state-management layers are updated.
- Tests cover primary and failure paths.
- Existing tagging, collection and multi-selection features remain functional.
- No network operation blocks initial bookmark persistence.
- Data can be exported and restored without losing relationships.

## Agent Workflow

For every feature:

1. Inspect the existing codebase and identify the current architecture.
2. Reuse established conventions unless they are clearly unsafe.
3. Propose schema and API changes before modifying code.
4. Implement the smallest complete vertical slice.
5. Add or update migrations.
6. Add tests.
7. Run formatting, static analysis and tests.
8. Summarise files changed, architectural decisions and remaining risks.
9. Do not introduce cloud services or paid dependencies without explicit approval.
10. Do not replace working existing features merely to match a preferred architecture.
