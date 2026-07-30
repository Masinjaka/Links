import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:linkvault/features/add_link/presentation/widget/add_link_body.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_options_sheet.dart';
import 'package:linkvault/l10n/app_localizations.dart';
import 'package:linkvault/l10n/linkvault_cupertino_localizations_delegate.dart';
import 'package:linkvault/l10n/linkvault_material_localizations_delegate.dart';

import '../support/linkvault_test_harness.dart';

void main() {
  testWidgets('add-link form and tag sheet render in French', (tester) async {
    final urlController = TextEditingController();
    final tagController = TextEditingController();
    final noteController = TextEditingController();
    addTearDown(urlController.dispose);
    addTearDown(tagController.dispose);
    addTearDown(noteController.dispose);

    await tester.pumpWidget(
      _localizedApp(
        locale: const Locale('fr'),
        child: AddLinkBody(
          isEditing: false,
          isSaving: false,
          urlController: urlController,
          tagController: tagController,
          noteController: noteController,
          urlDraft: '',
          preview: const AsyncLoading(),
          availableTags: const ['DESIGN'],
          selectedTags: const {},
          collections: const [],
          selectedCollectionId: null,
          onBack: () {},
          onUrlChanged: (_) {},
          onAddTag: (_) {},
          onToggleTag: (_) {},
          onCollectionSelected: (_) {},
          onSave: () {},
        ),
      ),
    );

    expect(find.text('NOUVEAU LIEN'), findsOneWidget);
    expect(find.text('Ajouter un lien'), findsOneWidget);
    expect(find.text('Collection'), findsOneWidget);
    expect(find.text('Note'), findsOneWidget);

    await tester.tap(find.byKey(const Key('add-link-new-tag-button')));
    await tester.pumpAndSettle();
    expect(find.text('Ajouter des étiquettes'), findsOneWidget);
    expect(find.text('Terminé'), findsOneWidget);
    expect(find.text('Rechercher ou ajouter une étiquette'), findsOneWidget);
  });

  testWidgets('link options render every action in Malagasy', (tester) async {
    await tester.pumpWidget(
      _localizedApp(
        locale: const Locale('mg'),
        child: LinkOptionsSheet(link: primaryLink.link, onSelected: (_) {}),
      ),
    );

    expect(find.text('Safidy'), findsOneWidget);
    expect(find.text('Hanova'), findsOneWidget);
    expect(find.text('Hizara'), findsOneWidget);
    expect(find.text('Hatao tahiry'), findsOneWidget);
    expect(find.text('Hamafa'), findsOneWidget);
  });
}

Widget _localizedApp({required Locale locale, required Widget child}) {
  return MaterialApp(
    locale: locale,
    localizationsDelegates: const [
      LinkVaultMaterialLocalizationsDelegate(),
      LinkVaultCupertinoLocalizationsDelegate(),
      ...AppLocalizations.localizationsDelegates,
    ],
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(body: child),
  );
}
