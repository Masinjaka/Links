import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_menu_action.dart';
import 'package:linkvault/features/link_details/presentation/widget/link_options_sheet.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class LinkActionsMenu extends StatelessWidget {
  const LinkActionsMenu({
    super.key,
    required this.link,
    required this.onSelected,
  });

  final Link link;
  final ValueChanged<LinkMenuAction> onSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      key: const Key('link-options-button'),
      onPressed: () => showLinkOptionsSheet(
        context: context,
        link: link,
        onSelected: onSelected,
      ),
      tooltip: linkVaultLocalizationsOf(context).options,
      visualDensity: VisualDensity.compact,
      icon: Icon(
        Icons.more_horiz_rounded,
        size: 22,
        color: LinkVaultThemeTokens.ink(context),
      ),
    );
  }
}
