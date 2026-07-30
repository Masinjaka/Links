import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class LinkVaultCupertinoLocalizationsDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const LinkVaultCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return const {'en', 'fr', 'mg'}.contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    if (locale.languageCode == 'mg') {
      return SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );
    }
    return GlobalCupertinoLocalizations.delegate.load(locale);
  }

  @override
  bool shouldReload(LinkVaultCupertinoLocalizationsDelegate old) => false;
}
