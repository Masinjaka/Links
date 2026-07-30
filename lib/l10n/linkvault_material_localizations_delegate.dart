import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LinkVaultMaterialLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const LinkVaultMaterialLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return const {'en', 'fr', 'mg'}.contains(locale.languageCode);
  }

  @override
  Future<MaterialLocalizations> load(Locale locale) {
    if (locale.languageCode == 'mg') {
      return SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );
    }
    return GlobalMaterialLocalizations.delegate.load(locale);
  }

  @override
  bool shouldReload(LinkVaultMaterialLocalizationsDelegate old) => false;
}
