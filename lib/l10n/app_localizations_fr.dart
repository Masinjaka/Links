// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'LinkVault';

  @override
  String get links => 'Liens';

  @override
  String get collections => 'Collections';

  @override
  String get linkSingular => 'lien';

  @override
  String get collectionSingular => 'collection';

  @override
  String get settings => 'Paramètres';

  @override
  String get linksPageTitle => 'ROHY';

  @override
  String get collectionsPageTitle => 'COLLECTIONS';

  @override
  String get settingsPageTitle => 'PARAMÈTRES';

  @override
  String get search => 'Rechercher';

  @override
  String get preferences => 'Préférences';

  @override
  String get theme => 'Thème';

  @override
  String get accentColor => 'Couleur d’accent';

  @override
  String get language => 'Langue';

  @override
  String get light => 'Clair';

  @override
  String get dark => 'Sombre';

  @override
  String get system => 'Système';

  @override
  String get red => 'Rouge';

  @override
  String get green => 'Vert';

  @override
  String get blue => 'Bleu';

  @override
  String get purple => 'Violet';

  @override
  String get malagasy => 'Malgache';

  @override
  String get french => 'Français';

  @override
  String get english => 'Anglais';

  @override
  String get exportLinksCsv => 'Exporter les liens en CSV';

  @override
  String get archived => 'Archivés';

  @override
  String get tags => 'Étiquettes';

  @override
  String get eraseData => 'Effacer les données';

  @override
  String get done => 'Terminé';

  @override
  String get addLink => 'Ajouter un lien';

  @override
  String get addCollection => 'Ajouter une collection';

  @override
  String get noLinksYet => 'Aucun lien.';

  @override
  String get noCollectionsYet => 'Aucune collection.';

  @override
  String get startByAddingSome => 'Commencez par en ajouter.';

  @override
  String get add => 'Ajouter';

  @override
  String get all => 'Tout';

  @override
  String get inbox => 'Boîte de réception';

  @override
  String get favorites => 'Favoris';

  @override
  String get trash => 'Corbeille';

  @override
  String get cancel => 'Annuler';

  @override
  String get close => 'Fermer';

  @override
  String get back => 'Retour';

  @override
  String get edit => 'Modifier';

  @override
  String get archive => 'Archiver';

  @override
  String get delete => 'Supprimer';

  @override
  String get options => 'Options';

  @override
  String get share => 'Partager';

  @override
  String get pin => 'Épingler';

  @override
  String get unpin => 'Désépingler';

  @override
  String get markAsFavorite => 'Ajouter aux favoris';

  @override
  String get removeFavorite => 'Retirer des favoris';

  @override
  String get restore => 'Restaurer';

  @override
  String get undo => 'Annuler';

  @override
  String get clear => 'Effacer';

  @override
  String get choose => 'Choisir';

  @override
  String get saving => 'Enregistrement…';

  @override
  String get updating => 'Mise à jour…';

  @override
  String get databaseError => 'Erreur de base de données';

  @override
  String get selectAll => 'Tout sélectionner';

  @override
  String get selectMultiple => 'Sélection multiple';

  @override
  String get selectMultipleTags => 'Sélectionner plusieurs étiquettes';

  @override
  String get sort => 'Trier';

  @override
  String get filterLinks => 'Filtrer les liens';

  @override
  String get domain => 'Domaine';

  @override
  String get contentType => 'Type de contenu';

  @override
  String get anyDomain => 'Tous les domaines';

  @override
  String get anyType => 'Tous les types';

  @override
  String get anyCollection => 'Toutes les collections';

  @override
  String get availableOffline => 'Disponible hors ligne';

  @override
  String get brokenLinks => 'Liens rompus';

  @override
  String get fromDate => 'Date de début';

  @override
  String get toDate => 'Date de fin';

  @override
  String fromValue(String date) {
    return 'Depuis le $date';
  }

  @override
  String toValue(String date) {
    return 'Jusqu’au $date';
  }

  @override
  String get recentlyAdded => 'Ajoutés récemment';

  @override
  String get oldest => 'Plus anciens';

  @override
  String get recentlyUpdated => 'Mis à jour récemment';

  @override
  String get recentlyOpened => 'Ouverts récemment';

  @override
  String get alphabetical => 'Alphabétique';

  @override
  String get manualOrder => 'Ordre manuel';

  @override
  String get recentlyCreated => 'Créées récemment';

  @override
  String get linkCountSort => 'Nombre de liens';

  @override
  String get sortLinks => 'Trier les liens';

  @override
  String get sortCollections => 'Trier les collections';

  @override
  String get tagSaveFailed => 'Échec de l’enregistrement de l’étiquette';

  @override
  String get addTags => 'Ajouter des étiquettes';

  @override
  String get searchOrAddTag => 'Rechercher ou ajouter une étiquette';

  @override
  String get selectCollection => 'Sélectionner une collection';

  @override
  String get searchCollection => 'Rechercher une collection';

  @override
  String get noCollectionsFound => 'Aucune collection trouvée';

  @override
  String get linkUrlHint => 'https://votre lien…';

  @override
  String get metadataFetching => 'Récupération des métadonnées…';

  @override
  String get pinLinkTooltip => 'épingler le lien';

  @override
  String get favoriteLinkTooltip => 'ajouter le lien aux favoris';

  @override
  String get metadataUnavailable => 'Métadonnées indisponibles';

  @override
  String get metadataRetryMessage =>
      'Le lien peut toujours être enregistré. Les métadonnées seront récupérées à nouveau.';

  @override
  String get pasteValidLink =>
      'Collez un lien valide pour récupérer les métadonnées.';

  @override
  String get linkAlreadySaved => 'Lien déjà enregistré';

  @override
  String linkAlreadySavedMessage(String title) {
    return '« $title » utilise déjà cette adresse.';
  }

  @override
  String get openExisting => 'Ouvrir l’existant';

  @override
  String get mergeOrganisation => 'Fusionner l’organisation';

  @override
  String get replaceMetadata => 'Remplacer les métadonnées';

  @override
  String get saveAnyway => 'Enregistrer quand même';

  @override
  String get collection => 'Collection';

  @override
  String get noCollection => 'Aucune collection';

  @override
  String get note => 'Note';

  @override
  String get addNote => 'Ajouter une note';

  @override
  String get updateLink => 'Mettre à jour le lien';

  @override
  String get newLink => 'NOUVEAU LIEN';

  @override
  String get editLink => 'MODIFIER LE LIEN';

  @override
  String get collectionName => 'Nom de la collection';

  @override
  String get updateCollection => 'Mettre à jour la collection';

  @override
  String get newCollection => 'NOUVELLE COLLECTION';

  @override
  String get editCollection => 'MODIFIER LA COLLECTION';

  @override
  String get icon => 'Icône';

  @override
  String get selectIcons => 'Sélectionner des icônes';

  @override
  String get searchIcon => 'Rechercher une icône';

  @override
  String get noIconsFound => 'Aucune icône trouvée';

  @override
  String get currentIcon => 'Icône actuelle';

  @override
  String get addCollections => 'Ajouter des collections';

  @override
  String get collectionNameRequired => 'Le nom de la collection est requis';

  @override
  String get collectionNotFound => 'Collection introuvable';

  @override
  String get removeFromCollection => 'Retirer de la collection';

  @override
  String get selectLinks => 'Sélectionner des liens';

  @override
  String get searchLink => 'Rechercher un lien';

  @override
  String get noAvailableLinks => 'Aucun lien disponible';

  @override
  String get selectExistingLinksDescription =>
      'Sélectionnez des liens enregistrés à joindre à cette collection.';

  @override
  String selectedDone(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count) Terminé',
      zero: 'Terminé',
    );
    return '$_temp0';
  }

  @override
  String linkCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liens',
      one: '1 lien',
      zero: '0 lien',
    );
    return '$_temp0';
  }

  @override
  String collectionType(String type) {
    return 'Collection $type';
  }

  @override
  String get general => 'Général';

  @override
  String get deleteCollectionQuestion => 'Supprimer la collection ?';

  @override
  String get deleteCollectionMessage =>
      'La collection sera supprimée. Ses liens resteront enregistrés.';

  @override
  String archiveCollectionMessage(String title) {
    return 'Voulez-vous vraiment archiver « $title » ? Vous pourrez la restaurer plus tard.';
  }

  @override
  String archiveCollectionsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Voulez-vous vraiment archiver $count collections sélectionnées ? Vous pourrez les restaurer plus tard.',
      one:
          'Voulez-vous vraiment archiver 1 collection sélectionnée ? Vous pourrez la restaurer plus tard.',
    );
    return '$_temp0';
  }

  @override
  String archiveLinksMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Voulez-vous vraiment archiver $count liens sélectionnés ? Vous pourrez les restaurer plus tard.',
      one:
          'Voulez-vous vraiment archiver 1 lien sélectionné ? Vous pourrez le restaurer plus tard.',
    );
    return '$_temp0';
  }

  @override
  String archiveLinkMessage(String title) {
    return 'Voulez-vous vraiment archiver « $title » ? Vous pourrez le restaurer plus tard.';
  }

  @override
  String get favoriteLinks => 'Ajouter les liens aux favoris';

  @override
  String get unfavoriteLinks => 'Retirer les liens des favoris';

  @override
  String get pinLinks => 'Épingler les liens';

  @override
  String get unpinLinks => 'Désépingler les liens';

  @override
  String get restoreLinks => 'Restaurer les liens';

  @override
  String get archiveLinks => 'Archiver les liens';

  @override
  String get moveToTrash => 'Mettre à la corbeille';

  @override
  String get deletePermanently => 'Supprimer définitivement';

  @override
  String get addLinkAction => 'Ajouter un lien';

  @override
  String trashedLinks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liens mis à la corbeille',
      one: '1 lien mis à la corbeille',
    );
    return '$_temp0';
  }

  @override
  String get deletePermanentlyQuestion => 'Supprimer définitivement ?';

  @override
  String linksCannotRestore(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count liens ne pourront pas être restaurés.',
      one: '1 lien ne pourra pas être restauré.',
    );
    return '$_temp0';
  }

  @override
  String get summary => 'Résumé';

  @override
  String get linkDetails => 'DÉTAILS DU LIEN';

  @override
  String get openLink => 'Ouvrir le lien';

  @override
  String get autoSummary => 'Résumé automatique';

  @override
  String get metadataTags => 'Étiquettes des métadonnées';

  @override
  String addedOn(String date) {
    return 'Ajouté le $date';
  }

  @override
  String get noLinkSelected => 'Aucun lien sélectionné';

  @override
  String get chooseLinkOrAdd => 'Choisissez un lien ou ajoutez-en un nouveau.';

  @override
  String get untitled => 'Sans titre';

  @override
  String get noteSaved => 'Note enregistrée';

  @override
  String get failedToOpenLink => 'Impossible d’ouvrir le lien';

  @override
  String get linkMovedToTrash => 'Lien mis à la corbeille';

  @override
  String get linkArchived => 'Lien archivé';

  @override
  String deleteItemsMessage(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Voulez-vous vraiment supprimer définitivement ces $count éléments ? Cette action est irréversible.',
      one:
          'Voulez-vous vraiment supprimer définitivement cet élément ? Cette action est irréversible.',
    );
    return '$_temp0';
  }

  @override
  String get restoreSelected => 'Restaurer la sélection';

  @override
  String get deleteSelectedTags => 'Supprimer les étiquettes sélectionnées';

  @override
  String get noArchivedLinks => 'Aucun lien archivé.';

  @override
  String get noArchivedCollections => 'Aucune collection archivée.';

  @override
  String unableToLoadTags(String error) {
    return 'Impossible de charger les étiquettes : $error';
  }

  @override
  String noAssetTags(String asset) {
    return 'Aucune étiquette de $asset.';
  }

  @override
  String tagUsage(int count, String asset) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count $asset',
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
          'Supprimer $count étiquettes sélectionnées ? Vos liens et collections resteront enregistrés.',
      one:
          'Supprimer 1 étiquette sélectionnée ? Vos liens et collections resteront enregistrés.',
    );
    return '$_temp0';
  }

  @override
  String get eraseDataMessage =>
      'Voulez-vous vraiment effacer définitivement tous les liens, collections, étiquettes et métadonnées ? Cette action est irréversible.';

  @override
  String get allDataErased => 'Toutes les données ont été effacées';

  @override
  String get skipIntro => 'Ignorer l’introduction';

  @override
  String get initializeVault => 'Initialiser le coffre';

  @override
  String get alreadyMemberSignIn => 'Déjà membre ? Se connecter';

  @override
  String get supportedPlatforms => 'Plateformes prises en charge';

  @override
  String get captureEverything => 'Capturez tout';

  @override
  String get captureEverythingDescription =>
      'Enregistrez instantanément les URL et organisez-les quand vous le souhaitez.';

  @override
  String get shareFromAnywhere => 'Partagez depuis partout';

  @override
  String get shareFromAnywhereDescription =>
      'Envoyez une page à LinkVault directement depuis le menu de partage.';

  @override
  String get velocitySearch => 'Recherche instantanée';

  @override
  String get velocitySearchDescription =>
      'Retrouvez n’importe quel lien local en quelques millisecondes.';

  @override
  String get storageCapacity => 'Capacité de stockage';

  @override
  String get linksSaved => 'Liens enregistrés';

  @override
  String get dataUsed => 'Données utilisées';

  @override
  String get linkVelocity30d => 'Activité des liens · 30 jours';

  @override
  String get systemPreferences => 'Préférences système';

  @override
  String get identityProfile => 'Profil d’identité';

  @override
  String get identityProfileDescription => 'Gérer votre signature numérique';

  @override
  String get encryptionKeys => 'Clés de chiffrement';

  @override
  String get encryptionKeysDescription => 'Sécurité du coffre et 2FA';

  @override
  String get pulseAlerts => 'Alertes';

  @override
  String get pulseAlertsDescription =>
      'Notifications de synchronisation et de liens';

  @override
  String get dataExport => 'Exportation des données';

  @override
  String get dataExportDescription => 'Télécharger l’archive du coffre (.json)';

  @override
  String get terminateSession => 'Fermer la session';
}
