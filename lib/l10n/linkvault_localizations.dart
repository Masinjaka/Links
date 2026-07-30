import 'package:flutter/widgets.dart';

import 'package:linkvault/l10n/app_localizations.dart';
import 'package:linkvault/l10n/app_localizations_en.dart';

export 'package:linkvault/l10n/app_localizations.dart';

AppLocalizations linkVaultLocalizationsOf(BuildContext context) {
  return Localizations.of<AppLocalizations>(context, AppLocalizations) ??
      AppLocalizationsEn();
}
