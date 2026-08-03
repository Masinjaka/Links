// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'LinkVault';

  @override
  String get links => 'Links';

  @override
  String get collections => 'Collections';

  @override
  String get linkSingular => 'link';

  @override
  String get collectionSingular => 'collection';

  @override
  String get settings => 'Settings';

  @override
  String get linksPageTitle => 'ROHY';

  @override
  String get collectionsPageTitle => 'COLLECTIONS';

  @override
  String get settingsPageTitle => 'SETTING';

  @override
  String get search => 'Search';

  @override
  String get preferences => 'Preferences';

  @override
  String get theme => 'Theme';

  @override
  String get accentColor => 'Accent color';

  @override
  String get language => 'Language';

  @override
  String get light => 'Light';

  @override
  String get dark => 'Dark';

  @override
  String get system => 'System';

  @override
  String get red => 'Red';

  @override
  String get green => 'Green';

  @override
  String get blue => 'Blue';

  @override
  String get purple => 'Purple';

  @override
  String get malagasy => 'Malagasy';

  @override
  String get french => 'French';

  @override
  String get english => 'English';

  @override
  String get exportLinksCsv => 'Export links to CSV';

  @override
  String get archived => 'Archived';

  @override
  String get tags => 'Tags';

  @override
  String get eraseData => 'Erase data';

  @override
  String get done => 'Done';

  @override
  String get addLink => 'Add link';

  @override
  String get addCollection => 'Add collection';

  @override
  String get createCollection => 'Create collection';

  @override
  String get noLinksYet => 'No links yet.';

  @override
  String get noCollectionsYet => 'No collections yet.';

  @override
  String get startByAddingSome => 'Start by adding some.';

  @override
  String get add => 'Add';

  @override
  String get all => 'All';

  @override
  String get inbox => 'Inbox';

  @override
  String get favorites => 'Favorites';

  @override
  String get trash => 'Trash';

  @override
  String get cancel => 'Cancel';

  @override
  String get close => 'Close';

  @override
  String get back => 'Back';

  @override
  String get edit => 'Edit';

  @override
  String get archive => 'Archive';

  @override
  String get delete => 'Delete';

  @override
  String get options => 'Options';

  @override
  String get share => 'Share';

  @override
  String get pin => 'Pin';

  @override
  String get unpin => 'Unpin';

  @override
  String get markAsFavorite => 'Mark as favorite';

  @override
  String get removeFavorite => 'Remove favorite';

  @override
  String get restore => 'Restore';

  @override
  String get undo => 'Undo';

  @override
  String get clear => 'Clear';

  @override
  String get choose => 'Choose';

  @override
  String get saving => 'Saving…';

  @override
  String get updating => 'Updating…';

  @override
  String get databaseError => 'Database error';

  @override
  String get selectAll => 'Select all';

  @override
  String get selectMultiple => 'select multiple';

  @override
  String get selectMultipleTags => 'select multiple tags';

  @override
  String get sort => 'Sort';

  @override
  String get filterLinks => 'Filter links';

  @override
  String get domain => 'Domain';

  @override
  String get contentType => 'Content type';

  @override
  String get anyDomain => 'Any domain';

  @override
  String get anyType => 'Any type';

  @override
  String get anyCollection => 'Any collection';

  @override
  String get availableOffline => 'Available offline';

  @override
  String get brokenLinks => 'Broken links';

  @override
  String get fromDate => 'From date';

  @override
  String get toDate => 'To date';

  @override
  String fromValue(String date) {
    return 'From $date';
  }

  @override
  String toValue(String date) {
    return 'To $date';
  }

  @override
  String get recentlyAdded => 'Recently added';

  @override
  String get oldest => 'Oldest';

  @override
  String get recentlyUpdated => 'Recently updated';

  @override
  String get recentlyOpened => 'Recently opened';

  @override
  String get alphabetical => 'Alphabetical';

  @override
  String get manualOrder => 'Manual order';

  @override
  String get recentlyCreated => 'Recently created';

  @override
  String get linkCountSort => 'Link count';

  @override
  String get sortLinks => 'sort links';

  @override
  String get sortCollections => 'sort collections';

  @override
  String get tagSaveFailed => 'Tag save failed';

  @override
  String get addTags => 'Add tags';

  @override
  String get searchOrAddTag => 'Search or add tag';

  @override
  String get selectCollection => 'Select collection';

  @override
  String get searchCollection => 'Search collection';

  @override
  String get noCollectionsFound => 'No collections found';

  @override
  String get linkUrlHint => 'https://your link...';

  @override
  String get metadataFetching => 'FETCHING_METADATA...';

  @override
  String get pinLinkTooltip => 'pin link';

  @override
  String get favoriteLinkTooltip => 'favourite link';

  @override
  String get metadataUnavailable => 'Metadata unavailable';

  @override
  String get metadataRetryMessage =>
      'The link can still be saved. Metadata will be fetched again on save.';

  @override
  String get pasteValidLink => 'Paste a valid link to fetch metadata.';

  @override
  String get linkAlreadySaved => 'Link already saved';

  @override
  String linkAlreadySavedMessage(String title) {
    return '“$title” already uses this address.';
  }

  @override
  String get openExisting => 'Open existing';

  @override
  String get mergeOrganisation => 'Merge organisation';

  @override
  String get replaceMetadata => 'Replace metadata';

  @override
  String get saveAnyway => 'Save anyway';

  @override
  String get collection => 'Collection';

  @override
  String get noCollection => 'No collection';

  @override
  String get note => 'Note';

  @override
  String get addNote => 'Add note';

  @override
  String get updateLink => 'Update link';

  @override
  String get newLink => 'NEW LINK';

  @override
  String get editLink => 'EDIT LINK';

  @override
  String get collectionName => 'Collection name';

  @override
  String get updateCollection => 'Update collection';

  @override
  String get newCollection => 'NEW COLLECTION';

  @override
  String get editCollection => 'EDIT COLLECTION';

  @override
  String get icon => 'Icon';

  @override
  String get selectIcons => 'Select icons';

  @override
  String get searchIcon => 'Search icon';

  @override
  String get noIconsFound => 'No icons found';

  @override
  String get currentIcon => 'Current icon';

  @override
  String get addCollections => 'Add collections';

  @override
  String get collectionNameRequired => 'Collection name required';

  @override
  String get collectionNotFound => 'Collection not found';

  @override
  String get removeFromCollection => 'Remove from collection';

  @override
  String get selectLinks => 'Select links';

  @override
  String get searchLink => 'Search link';

  @override
  String get noAvailableLinks => 'No available links';

  @override
  String get selectExistingLinksDescription =>
      'Select existing saved links to attach to this collection.';

  @override
  String selectedDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count) Done',
      zero: 'Done',
    );
    return '$_temp0';
  }

  @override
  String linkCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count links',
      one: '1 link',
      zero: '0 links',
    );
    return '$_temp0';
  }

  @override
  String collectionType(String type) {
    return '$type collection';
  }

  @override
  String get general => 'General';

  @override
  String get deleteCollectionQuestion => 'Delete collection?';

  @override
  String get deleteCollectionMessage =>
      'The collection will be deleted. Its links will remain saved.';

  @override
  String archiveCollectionMessage(String title) {
    return 'Are you sure you want to archive “$title”? You can restore it later.';
  }

  @override
  String archiveCollectionsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Are you sure you want to archive $count selected collections? You can restore them later.',
      one:
          'Are you sure you want to archive 1 selected collection? You can restore it later.',
    );
    return '$_temp0';
  }

  @override
  String archiveLinksMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Are you sure you want to archive $count selected links? You can restore them later.',
      one:
          'Are you sure you want to archive 1 selected link? You can restore it later.',
    );
    return '$_temp0';
  }

  @override
  String archiveLinkMessage(String title) {
    return 'Are you sure you want to archive “$title”? You can restore it later.';
  }

  @override
  String get favoriteLinks => 'Favorite links';

  @override
  String get unfavoriteLinks => 'Unfavorite links';

  @override
  String get pinLinks => 'Pin links';

  @override
  String get unpinLinks => 'Unpin links';

  @override
  String get restoreLinks => 'Restore links';

  @override
  String get archiveLinks => 'Archive links';

  @override
  String get moveToTrash => 'Move to trash';

  @override
  String get deletePermanently => 'Delete permanently';

  @override
  String get addLinkAction => 'Add link';

  @override
  String trashedLinks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count links trashed',
      one: '1 link trashed',
    );
    return '$_temp0';
  }

  @override
  String deletedLinks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count links deleted',
      one: '1 link deleted',
    );
    return '$_temp0';
  }

  @override
  String get deletePermanentlyQuestion => 'Delete permanently?';

  @override
  String deleteLinksMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'These $count links will be permanently deleted. You can undo immediately afterward.',
      one:
          'This link will be permanently deleted. You can undo immediately afterward.',
    );
    return '$_temp0';
  }

  @override
  String linksCannotRestore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count links cannot be restored.',
      one: '1 link cannot be restored.',
    );
    return '$_temp0';
  }

  @override
  String get summary => 'Summary';

  @override
  String get linkDetails => 'LINK DETAILS';

  @override
  String get openLink => 'Open link';

  @override
  String get autoSummary => 'Auto summary';

  @override
  String get metadataTags => 'Metadata tags';

  @override
  String addedOn(String date) {
    return 'Added $date';
  }

  @override
  String get noLinkSelected => 'No link selected';

  @override
  String get chooseLinkOrAdd => 'Choose a link from the feed or add a new one.';

  @override
  String get untitled => 'Untitled';

  @override
  String get noteSaved => 'Note saved';

  @override
  String get failedToOpenLink => 'Failed to open link';

  @override
  String get linkMovedToTrash => 'Link moved to trash';

  @override
  String get linkArchived => 'Link archived';

  @override
  String deleteItemsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Are you sure you want to permanently delete these $count items? This action is irreversible.',
      one:
          'Are you sure you want to permanently delete this item? This action is irreversible.',
    );
    return '$_temp0';
  }

  @override
  String get restoreSelected => 'Restore selected';

  @override
  String get deleteSelectedTags => 'Delete selected tags';

  @override
  String get noArchivedLinks => 'No archived links.';

  @override
  String get noArchivedCollections => 'No archived collections.';

  @override
  String unableToLoadTags(String error) {
    return 'Unable to load tags: $error';
  }

  @override
  String noAssetTags(String asset) {
    return 'No $asset tags yet.';
  }

  @override
  String tagUsage(int count, String asset) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ${asset}s',
      one: '1 $asset',
    );
    return '$_temp0';
  }

  @override
  String deleteTagsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Delete $count selected tags? Your links and collections will remain saved.',
      one:
          'Delete 1 selected tag? Your links and collections will remain saved.',
    );
    return '$_temp0';
  }

  @override
  String get eraseDataMessage =>
      'Are you sure you want to permanently erase all links, collections, tags, and saved metadata? This action is irreversible.';

  @override
  String get allDataErased => 'All data erased';

  @override
  String get skipIntro => 'Skip intro';

  @override
  String get initializeVault => 'Initialize vault';

  @override
  String get alreadyMemberSignIn => 'Already a member? Sign in';

  @override
  String get supportedPlatforms => 'Supported platforms';

  @override
  String get captureEverything => 'Capture everything';

  @override
  String get captureEverythingDescription =>
      'Save URLs instantly and organise them when you are ready.';

  @override
  String get shareFromAnywhere => 'Share from anywhere';

  @override
  String get shareFromAnywhereDescription =>
      'Send a page to LinkVault directly from your browser share sheet.';

  @override
  String get velocitySearch => 'Velocity search';

  @override
  String get velocitySearchDescription =>
      'Find any locally stored link in milliseconds.';

  @override
  String get storageCapacity => 'Storage capacity';

  @override
  String get linksSaved => 'Links saved';

  @override
  String get dataUsed => 'Data used';

  @override
  String get linkVelocity30d => 'Link velocity · 30 days';

  @override
  String get systemPreferences => 'System preferences';

  @override
  String get identityProfile => 'Identity profile';

  @override
  String get identityProfileDescription => 'Manage your digital signature';

  @override
  String get encryptionKeys => 'Encryption keys';

  @override
  String get encryptionKeysDescription => 'Vault security & 2FA';

  @override
  String get pulseAlerts => 'Pulse alerts';

  @override
  String get pulseAlertsDescription => 'Sync and link notifications';

  @override
  String get dataExport => 'Data export';

  @override
  String get dataExportDescription => 'Download vault archive (.json)';

  @override
  String get terminateSession => 'Terminate session';
}
