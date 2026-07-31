import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_mg.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
    Locale('mg'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'LinkVault'**
  String get appTitle;

  /// No description provided for @links.
  ///
  /// In en, this message translates to:
  /// **'Links'**
  String get links;

  /// No description provided for @collections.
  ///
  /// In en, this message translates to:
  /// **'Collections'**
  String get collections;

  /// No description provided for @linkSingular.
  ///
  /// In en, this message translates to:
  /// **'link'**
  String get linkSingular;

  /// No description provided for @collectionSingular.
  ///
  /// In en, this message translates to:
  /// **'collection'**
  String get collectionSingular;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @linksPageTitle.
  ///
  /// In en, this message translates to:
  /// **'ROHY'**
  String get linksPageTitle;

  /// No description provided for @collectionsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'COLLECTIONS'**
  String get collectionsPageTitle;

  /// No description provided for @settingsPageTitle.
  ///
  /// In en, this message translates to:
  /// **'SETTING'**
  String get settingsPageTitle;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @preferences.
  ///
  /// In en, this message translates to:
  /// **'Preferences'**
  String get preferences;

  /// No description provided for @theme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get theme;

  /// No description provided for @accentColor.
  ///
  /// In en, this message translates to:
  /// **'Accent color'**
  String get accentColor;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @light.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get light;

  /// No description provided for @dark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get dark;

  /// No description provided for @system.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get system;

  /// No description provided for @red.
  ///
  /// In en, this message translates to:
  /// **'Red'**
  String get red;

  /// No description provided for @green.
  ///
  /// In en, this message translates to:
  /// **'Green'**
  String get green;

  /// No description provided for @blue.
  ///
  /// In en, this message translates to:
  /// **'Blue'**
  String get blue;

  /// No description provided for @purple.
  ///
  /// In en, this message translates to:
  /// **'Purple'**
  String get purple;

  /// No description provided for @malagasy.
  ///
  /// In en, this message translates to:
  /// **'Malagasy'**
  String get malagasy;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get french;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @exportLinksCsv.
  ///
  /// In en, this message translates to:
  /// **'Export links to CSV'**
  String get exportLinksCsv;

  /// No description provided for @archived.
  ///
  /// In en, this message translates to:
  /// **'Archived'**
  String get archived;

  /// No description provided for @tags.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tags;

  /// No description provided for @eraseData.
  ///
  /// In en, this message translates to:
  /// **'Erase data'**
  String get eraseData;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @addLink.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get addLink;

  /// No description provided for @addCollection.
  ///
  /// In en, this message translates to:
  /// **'Add collection'**
  String get addCollection;

  /// No description provided for @noLinksYet.
  ///
  /// In en, this message translates to:
  /// **'No links yet.'**
  String get noLinksYet;

  /// No description provided for @noCollectionsYet.
  ///
  /// In en, this message translates to:
  /// **'No collections yet.'**
  String get noCollectionsYet;

  /// No description provided for @startByAddingSome.
  ///
  /// In en, this message translates to:
  /// **'Start by adding some.'**
  String get startByAddingSome;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favorites;

  /// No description provided for @trash.
  ///
  /// In en, this message translates to:
  /// **'Trash'**
  String get trash;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @options.
  ///
  /// In en, this message translates to:
  /// **'Options'**
  String get options;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get share;

  /// No description provided for @pin.
  ///
  /// In en, this message translates to:
  /// **'Pin'**
  String get pin;

  /// No description provided for @unpin.
  ///
  /// In en, this message translates to:
  /// **'Unpin'**
  String get unpin;

  /// No description provided for @markAsFavorite.
  ///
  /// In en, this message translates to:
  /// **'Mark as favorite'**
  String get markAsFavorite;

  /// No description provided for @removeFavorite.
  ///
  /// In en, this message translates to:
  /// **'Remove favorite'**
  String get removeFavorite;

  /// No description provided for @restore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get restore;

  /// No description provided for @undo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get undo;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Clear'**
  String get clear;

  /// No description provided for @choose.
  ///
  /// In en, this message translates to:
  /// **'Choose'**
  String get choose;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get saving;

  /// No description provided for @updating.
  ///
  /// In en, this message translates to:
  /// **'Updating…'**
  String get updating;

  /// No description provided for @databaseError.
  ///
  /// In en, this message translates to:
  /// **'Database error'**
  String get databaseError;

  /// No description provided for @selectAll.
  ///
  /// In en, this message translates to:
  /// **'Select all'**
  String get selectAll;

  /// No description provided for @selectMultiple.
  ///
  /// In en, this message translates to:
  /// **'select multiple'**
  String get selectMultiple;

  /// No description provided for @selectMultipleTags.
  ///
  /// In en, this message translates to:
  /// **'select multiple tags'**
  String get selectMultipleTags;

  /// No description provided for @sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get sort;

  /// No description provided for @filterLinks.
  ///
  /// In en, this message translates to:
  /// **'Filter links'**
  String get filterLinks;

  /// No description provided for @domain.
  ///
  /// In en, this message translates to:
  /// **'Domain'**
  String get domain;

  /// No description provided for @contentType.
  ///
  /// In en, this message translates to:
  /// **'Content type'**
  String get contentType;

  /// No description provided for @anyDomain.
  ///
  /// In en, this message translates to:
  /// **'Any domain'**
  String get anyDomain;

  /// No description provided for @anyType.
  ///
  /// In en, this message translates to:
  /// **'Any type'**
  String get anyType;

  /// No description provided for @anyCollection.
  ///
  /// In en, this message translates to:
  /// **'Any collection'**
  String get anyCollection;

  /// No description provided for @availableOffline.
  ///
  /// In en, this message translates to:
  /// **'Available offline'**
  String get availableOffline;

  /// No description provided for @brokenLinks.
  ///
  /// In en, this message translates to:
  /// **'Broken links'**
  String get brokenLinks;

  /// No description provided for @fromDate.
  ///
  /// In en, this message translates to:
  /// **'From date'**
  String get fromDate;

  /// No description provided for @toDate.
  ///
  /// In en, this message translates to:
  /// **'To date'**
  String get toDate;

  /// No description provided for @fromValue.
  ///
  /// In en, this message translates to:
  /// **'From {date}'**
  String fromValue(String date);

  /// No description provided for @toValue.
  ///
  /// In en, this message translates to:
  /// **'To {date}'**
  String toValue(String date);

  /// No description provided for @recentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get recentlyAdded;

  /// No description provided for @oldest.
  ///
  /// In en, this message translates to:
  /// **'Oldest'**
  String get oldest;

  /// No description provided for @recentlyUpdated.
  ///
  /// In en, this message translates to:
  /// **'Recently updated'**
  String get recentlyUpdated;

  /// No description provided for @recentlyOpened.
  ///
  /// In en, this message translates to:
  /// **'Recently opened'**
  String get recentlyOpened;

  /// No description provided for @alphabetical.
  ///
  /// In en, this message translates to:
  /// **'Alphabetical'**
  String get alphabetical;

  /// No description provided for @manualOrder.
  ///
  /// In en, this message translates to:
  /// **'Manual order'**
  String get manualOrder;

  /// No description provided for @recentlyCreated.
  ///
  /// In en, this message translates to:
  /// **'Recently created'**
  String get recentlyCreated;

  /// No description provided for @linkCountSort.
  ///
  /// In en, this message translates to:
  /// **'Link count'**
  String get linkCountSort;

  /// No description provided for @sortLinks.
  ///
  /// In en, this message translates to:
  /// **'sort links'**
  String get sortLinks;

  /// No description provided for @sortCollections.
  ///
  /// In en, this message translates to:
  /// **'sort collections'**
  String get sortCollections;

  /// No description provided for @tagSaveFailed.
  ///
  /// In en, this message translates to:
  /// **'Tag save failed'**
  String get tagSaveFailed;

  /// No description provided for @addTags.
  ///
  /// In en, this message translates to:
  /// **'Add tags'**
  String get addTags;

  /// No description provided for @searchOrAddTag.
  ///
  /// In en, this message translates to:
  /// **'Search or add tag'**
  String get searchOrAddTag;

  /// No description provided for @selectCollection.
  ///
  /// In en, this message translates to:
  /// **'Select collection'**
  String get selectCollection;

  /// No description provided for @searchCollection.
  ///
  /// In en, this message translates to:
  /// **'Search collection'**
  String get searchCollection;

  /// No description provided for @noCollectionsFound.
  ///
  /// In en, this message translates to:
  /// **'No collections found'**
  String get noCollectionsFound;

  /// No description provided for @linkUrlHint.
  ///
  /// In en, this message translates to:
  /// **'https://your link...'**
  String get linkUrlHint;

  /// No description provided for @metadataFetching.
  ///
  /// In en, this message translates to:
  /// **'FETCHING_METADATA...'**
  String get metadataFetching;

  /// No description provided for @pinLinkTooltip.
  ///
  /// In en, this message translates to:
  /// **'pin link'**
  String get pinLinkTooltip;

  /// No description provided for @favoriteLinkTooltip.
  ///
  /// In en, this message translates to:
  /// **'favourite link'**
  String get favoriteLinkTooltip;

  /// No description provided for @metadataUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Metadata unavailable'**
  String get metadataUnavailable;

  /// No description provided for @metadataRetryMessage.
  ///
  /// In en, this message translates to:
  /// **'The link can still be saved. Metadata will be fetched again on save.'**
  String get metadataRetryMessage;

  /// No description provided for @pasteValidLink.
  ///
  /// In en, this message translates to:
  /// **'Paste a valid link to fetch metadata.'**
  String get pasteValidLink;

  /// No description provided for @linkAlreadySaved.
  ///
  /// In en, this message translates to:
  /// **'Link already saved'**
  String get linkAlreadySaved;

  /// No description provided for @linkAlreadySavedMessage.
  ///
  /// In en, this message translates to:
  /// **'“{title}” already uses this address.'**
  String linkAlreadySavedMessage(String title);

  /// No description provided for @openExisting.
  ///
  /// In en, this message translates to:
  /// **'Open existing'**
  String get openExisting;

  /// No description provided for @mergeOrganisation.
  ///
  /// In en, this message translates to:
  /// **'Merge organisation'**
  String get mergeOrganisation;

  /// No description provided for @replaceMetadata.
  ///
  /// In en, this message translates to:
  /// **'Replace metadata'**
  String get replaceMetadata;

  /// No description provided for @saveAnyway.
  ///
  /// In en, this message translates to:
  /// **'Save anyway'**
  String get saveAnyway;

  /// No description provided for @collection.
  ///
  /// In en, this message translates to:
  /// **'Collection'**
  String get collection;

  /// No description provided for @noCollection.
  ///
  /// In en, this message translates to:
  /// **'No collection'**
  String get noCollection;

  /// No description provided for @note.
  ///
  /// In en, this message translates to:
  /// **'Note'**
  String get note;

  /// No description provided for @addNote.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get addNote;

  /// No description provided for @updateLink.
  ///
  /// In en, this message translates to:
  /// **'Update link'**
  String get updateLink;

  /// No description provided for @newLink.
  ///
  /// In en, this message translates to:
  /// **'NEW LINK'**
  String get newLink;

  /// No description provided for @editLink.
  ///
  /// In en, this message translates to:
  /// **'EDIT LINK'**
  String get editLink;

  /// No description provided for @collectionName.
  ///
  /// In en, this message translates to:
  /// **'Collection name'**
  String get collectionName;

  /// No description provided for @updateCollection.
  ///
  /// In en, this message translates to:
  /// **'Update collection'**
  String get updateCollection;

  /// No description provided for @newCollection.
  ///
  /// In en, this message translates to:
  /// **'NEW COLLECTION'**
  String get newCollection;

  /// No description provided for @editCollection.
  ///
  /// In en, this message translates to:
  /// **'EDIT COLLECTION'**
  String get editCollection;

  /// No description provided for @icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get icon;

  /// No description provided for @selectIcons.
  ///
  /// In en, this message translates to:
  /// **'Select icons'**
  String get selectIcons;

  /// No description provided for @searchIcon.
  ///
  /// In en, this message translates to:
  /// **'Search icon'**
  String get searchIcon;

  /// No description provided for @noIconsFound.
  ///
  /// In en, this message translates to:
  /// **'No icons found'**
  String get noIconsFound;

  /// No description provided for @currentIcon.
  ///
  /// In en, this message translates to:
  /// **'Current icon'**
  String get currentIcon;

  /// No description provided for @addCollections.
  ///
  /// In en, this message translates to:
  /// **'Add collections'**
  String get addCollections;

  /// No description provided for @collectionNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Collection name required'**
  String get collectionNameRequired;

  /// No description provided for @collectionNotFound.
  ///
  /// In en, this message translates to:
  /// **'Collection not found'**
  String get collectionNotFound;

  /// No description provided for @removeFromCollection.
  ///
  /// In en, this message translates to:
  /// **'Remove from collection'**
  String get removeFromCollection;

  /// No description provided for @selectLinks.
  ///
  /// In en, this message translates to:
  /// **'Select links'**
  String get selectLinks;

  /// No description provided for @searchLink.
  ///
  /// In en, this message translates to:
  /// **'Search link'**
  String get searchLink;

  /// No description provided for @noAvailableLinks.
  ///
  /// In en, this message translates to:
  /// **'No available links'**
  String get noAvailableLinks;

  /// No description provided for @selectExistingLinksDescription.
  ///
  /// In en, this message translates to:
  /// **'Select existing saved links to attach to this collection.'**
  String get selectExistingLinksDescription;

  /// No description provided for @selectedDone.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Done} other{({count}) Done}}'**
  String selectedDone(int count);

  /// No description provided for @linkCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 links} =1{1 link} other{{count} links}}'**
  String linkCount(int count);

  /// No description provided for @collectionType.
  ///
  /// In en, this message translates to:
  /// **'{type} collection'**
  String collectionType(String type);

  /// No description provided for @general.
  ///
  /// In en, this message translates to:
  /// **'General'**
  String get general;

  /// No description provided for @deleteCollectionQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete collection?'**
  String get deleteCollectionQuestion;

  /// No description provided for @deleteCollectionMessage.
  ///
  /// In en, this message translates to:
  /// **'The collection will be deleted. Its links will remain saved.'**
  String get deleteCollectionMessage;

  /// No description provided for @archiveCollectionMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to archive “{title}”? You can restore it later.'**
  String archiveCollectionMessage(String title);

  /// No description provided for @archiveCollectionsMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Are you sure you want to archive 1 selected collection? You can restore it later.} other{Are you sure you want to archive {count} selected collections? You can restore them later.}}'**
  String archiveCollectionsMessage(int count);

  /// No description provided for @archiveLinksMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Are you sure you want to archive 1 selected link? You can restore it later.} other{Are you sure you want to archive {count} selected links? You can restore them later.}}'**
  String archiveLinksMessage(int count);

  /// No description provided for @archiveLinkMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to archive “{title}”? You can restore it later.'**
  String archiveLinkMessage(String title);

  /// No description provided for @favoriteLinks.
  ///
  /// In en, this message translates to:
  /// **'Favorite links'**
  String get favoriteLinks;

  /// No description provided for @unfavoriteLinks.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite links'**
  String get unfavoriteLinks;

  /// No description provided for @pinLinks.
  ///
  /// In en, this message translates to:
  /// **'Pin links'**
  String get pinLinks;

  /// No description provided for @unpinLinks.
  ///
  /// In en, this message translates to:
  /// **'Unpin links'**
  String get unpinLinks;

  /// No description provided for @restoreLinks.
  ///
  /// In en, this message translates to:
  /// **'Restore links'**
  String get restoreLinks;

  /// No description provided for @archiveLinks.
  ///
  /// In en, this message translates to:
  /// **'Archive links'**
  String get archiveLinks;

  /// No description provided for @moveToTrash.
  ///
  /// In en, this message translates to:
  /// **'Move to trash'**
  String get moveToTrash;

  /// No description provided for @deletePermanently.
  ///
  /// In en, this message translates to:
  /// **'Delete permanently'**
  String get deletePermanently;

  /// No description provided for @addLinkAction.
  ///
  /// In en, this message translates to:
  /// **'Add link'**
  String get addLinkAction;

  /// No description provided for @trashedLinks.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 link trashed} other{{count} links trashed}}'**
  String trashedLinks(int count);

  /// No description provided for @deletePermanentlyQuestion.
  ///
  /// In en, this message translates to:
  /// **'Delete permanently?'**
  String get deletePermanentlyQuestion;

  /// No description provided for @linksCannotRestore.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 link cannot be restored.} other{{count} links cannot be restored.}}'**
  String linksCannotRestore(int count);

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @linkDetails.
  ///
  /// In en, this message translates to:
  /// **'LINK DETAILS'**
  String get linkDetails;

  /// No description provided for @openLink.
  ///
  /// In en, this message translates to:
  /// **'Open link'**
  String get openLink;

  /// No description provided for @autoSummary.
  ///
  /// In en, this message translates to:
  /// **'Auto summary'**
  String get autoSummary;

  /// No description provided for @metadataTags.
  ///
  /// In en, this message translates to:
  /// **'Metadata tags'**
  String get metadataTags;

  /// No description provided for @addedOn.
  ///
  /// In en, this message translates to:
  /// **'Added {date}'**
  String addedOn(String date);

  /// No description provided for @noLinkSelected.
  ///
  /// In en, this message translates to:
  /// **'No link selected'**
  String get noLinkSelected;

  /// No description provided for @chooseLinkOrAdd.
  ///
  /// In en, this message translates to:
  /// **'Choose a link from the feed or add a new one.'**
  String get chooseLinkOrAdd;

  /// No description provided for @untitled.
  ///
  /// In en, this message translates to:
  /// **'Untitled'**
  String get untitled;

  /// No description provided for @noteSaved.
  ///
  /// In en, this message translates to:
  /// **'Note saved'**
  String get noteSaved;

  /// No description provided for @failedToOpenLink.
  ///
  /// In en, this message translates to:
  /// **'Failed to open link'**
  String get failedToOpenLink;

  /// No description provided for @linkMovedToTrash.
  ///
  /// In en, this message translates to:
  /// **'Link moved to trash'**
  String get linkMovedToTrash;

  /// No description provided for @linkArchived.
  ///
  /// In en, this message translates to:
  /// **'Link archived'**
  String get linkArchived;

  /// No description provided for @deleteItemsMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Are you sure you want to permanently delete this item? This action is irreversible.} other{Are you sure you want to permanently delete these {count} items? This action is irreversible.}}'**
  String deleteItemsMessage(int count);

  /// No description provided for @restoreSelected.
  ///
  /// In en, this message translates to:
  /// **'Restore selected'**
  String get restoreSelected;

  /// No description provided for @deleteSelectedTags.
  ///
  /// In en, this message translates to:
  /// **'Delete selected tags'**
  String get deleteSelectedTags;

  /// No description provided for @noArchivedLinks.
  ///
  /// In en, this message translates to:
  /// **'No archived links.'**
  String get noArchivedLinks;

  /// No description provided for @noArchivedCollections.
  ///
  /// In en, this message translates to:
  /// **'No archived collections.'**
  String get noArchivedCollections;

  /// No description provided for @unableToLoadTags.
  ///
  /// In en, this message translates to:
  /// **'Unable to load tags: {error}'**
  String unableToLoadTags(String error);

  /// No description provided for @noAssetTags.
  ///
  /// In en, this message translates to:
  /// **'No {asset} tags yet.'**
  String noAssetTags(String asset);

  /// No description provided for @tagUsage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 {asset}} other{{count} {asset}s}}'**
  String tagUsage(int count, String asset);

  /// No description provided for @deleteTagsMessage.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{Delete 1 selected tag? Your links and collections will remain saved.} other{Delete {count} selected tags? Your links and collections will remain saved.}}'**
  String deleteTagsMessage(int count);

  /// No description provided for @eraseDataMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to permanently erase all links, collections, tags, and saved metadata? This action is irreversible.'**
  String get eraseDataMessage;

  /// No description provided for @allDataErased.
  ///
  /// In en, this message translates to:
  /// **'All data erased'**
  String get allDataErased;

  /// No description provided for @skipIntro.
  ///
  /// In en, this message translates to:
  /// **'Skip intro'**
  String get skipIntro;

  /// No description provided for @initializeVault.
  ///
  /// In en, this message translates to:
  /// **'Initialize vault'**
  String get initializeVault;

  /// No description provided for @alreadyMemberSignIn.
  ///
  /// In en, this message translates to:
  /// **'Already a member? Sign in'**
  String get alreadyMemberSignIn;

  /// No description provided for @supportedPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Supported platforms'**
  String get supportedPlatforms;

  /// No description provided for @captureEverything.
  ///
  /// In en, this message translates to:
  /// **'Capture everything'**
  String get captureEverything;

  /// No description provided for @captureEverythingDescription.
  ///
  /// In en, this message translates to:
  /// **'Save URLs instantly and organise them when you are ready.'**
  String get captureEverythingDescription;

  /// No description provided for @shareFromAnywhere.
  ///
  /// In en, this message translates to:
  /// **'Share from anywhere'**
  String get shareFromAnywhere;

  /// No description provided for @shareFromAnywhereDescription.
  ///
  /// In en, this message translates to:
  /// **'Send a page to LinkVault directly from your browser share sheet.'**
  String get shareFromAnywhereDescription;

  /// No description provided for @velocitySearch.
  ///
  /// In en, this message translates to:
  /// **'Velocity search'**
  String get velocitySearch;

  /// No description provided for @velocitySearchDescription.
  ///
  /// In en, this message translates to:
  /// **'Find any locally stored link in milliseconds.'**
  String get velocitySearchDescription;

  /// No description provided for @storageCapacity.
  ///
  /// In en, this message translates to:
  /// **'Storage capacity'**
  String get storageCapacity;

  /// No description provided for @linksSaved.
  ///
  /// In en, this message translates to:
  /// **'Links saved'**
  String get linksSaved;

  /// No description provided for @dataUsed.
  ///
  /// In en, this message translates to:
  /// **'Data used'**
  String get dataUsed;

  /// No description provided for @linkVelocity30d.
  ///
  /// In en, this message translates to:
  /// **'Link velocity · 30 days'**
  String get linkVelocity30d;

  /// No description provided for @systemPreferences.
  ///
  /// In en, this message translates to:
  /// **'System preferences'**
  String get systemPreferences;

  /// No description provided for @identityProfile.
  ///
  /// In en, this message translates to:
  /// **'Identity profile'**
  String get identityProfile;

  /// No description provided for @identityProfileDescription.
  ///
  /// In en, this message translates to:
  /// **'Manage your digital signature'**
  String get identityProfileDescription;

  /// No description provided for @encryptionKeys.
  ///
  /// In en, this message translates to:
  /// **'Encryption keys'**
  String get encryptionKeys;

  /// No description provided for @encryptionKeysDescription.
  ///
  /// In en, this message translates to:
  /// **'Vault security & 2FA'**
  String get encryptionKeysDescription;

  /// No description provided for @pulseAlerts.
  ///
  /// In en, this message translates to:
  /// **'Pulse alerts'**
  String get pulseAlerts;

  /// No description provided for @pulseAlertsDescription.
  ///
  /// In en, this message translates to:
  /// **'Sync and link notifications'**
  String get pulseAlertsDescription;

  /// No description provided for @dataExport.
  ///
  /// In en, this message translates to:
  /// **'Data export'**
  String get dataExport;

  /// No description provided for @dataExportDescription.
  ///
  /// In en, this message translates to:
  /// **'Download vault archive (.json)'**
  String get dataExportDescription;

  /// No description provided for @terminateSession.
  ///
  /// In en, this message translates to:
  /// **'Terminate session'**
  String get terminateSession;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr', 'mg'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
    case 'mg':
      return AppLocalizationsMg();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
