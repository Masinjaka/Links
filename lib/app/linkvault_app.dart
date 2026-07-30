import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/app_router.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/providers/database_providers.dart';
import 'package:linkvault/features/add_link/provider/shared_url_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_metadata_providers.dart';
import 'package:linkvault/features/add_link/presentation/show_add_link_sheet.dart';
import 'package:linkvault/features/settings/provider/settings_providers.dart';
import 'package:linkvault/l10n/app_localizations.dart';
import 'package:linkvault/l10n/linkvault_cupertino_localizations_delegate.dart';
import 'package:linkvault/l10n/linkvault_material_localizations_delegate.dart';
import 'package:linkvault/shared/presentation/widgets/compact_app_viewport.dart';

class LinkVaultApp extends ConsumerStatefulWidget {
  const LinkVaultApp({super.key});

  @override
  ConsumerState<LinkVaultApp> createState() => _LinkVaultAppState();
}

class _LinkVaultAppState extends ConsumerState<LinkVaultApp> {
  StreamSubscription<String>? _sharedUrlSubscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _listenForSharedUrls());
  }

  @override
  void dispose() {
    _sharedUrlSubscription?.cancel();
    super.dispose();
  }

  Future<void> _listenForSharedUrls() async {
    final service = ref.read(sharedUrlServiceProvider);
    _sharedUrlSubscription = service.sharedUrls.listen(_openCapture);
    final initial = await service.takeInitialUrl();
    if (initial != null) _openCapture(initial);
  }

  void _openCapture(String url) {
    final context = rootNavigatorKey.currentContext;
    if (context == null) {
      appRouter.go('/add?sharedUrl=${Uri.encodeQueryComponent(url)}');
      return;
    }
    showAddLinkSheet(context, initialUrl: url);
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(seedDatabaseProvider);
    ref.watch(metadataTaskRunnerProvider);
    final themePreference = ref.watch(selectedAppThemePreferenceProvider);
    final accentTone = ref.watch(selectedAccentToneProvider);
    final language = ref.watch(selectedAppLanguageProvider);
    final accentColor = Color(accentTone.colorValue);
    LinkVaultColors.applyAccent(accentColor);

    return MaterialApp.router(
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      locale: Locale(language.localeCode),
      localizationsDelegates: const [
        LinkVaultMaterialLocalizationsDelegate(),
        LinkVaultCupertinoLocalizationsDelegate(),
        ...AppLocalizations.localizationsDelegates,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: LinkVaultTheme.light(accentColor),
      darkTheme: LinkVaultTheme.dark(accentColor),
      themeMode: switch (themePreference) {
        AppThemePreference.system => ThemeMode.system,
        AppThemePreference.light => ThemeMode.light,
        AppThemePreference.dark => ThemeMode.dark,
      },
      builder: (context, child) {
        return CompactAppViewport(child: child ?? const SizedBox.shrink());
      },
      routerConfig: appRouter,
    );
  }
}
