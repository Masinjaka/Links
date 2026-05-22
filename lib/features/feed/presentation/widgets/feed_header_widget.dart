import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/widgets/page_title_widget.dart';
import 'package:linkvault/shared/presentation/widgets/square_button_widget.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PageTitle(title: 'SAVEYO', subtitle: 'LINNKS'),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SquareButton(
                  onPressed: () => context.go('/collections'),
                  icon: Icons.folder_copy_outlined,
                  size: 45,
                  backgroundColor: LinkVaultThemeTokens.surface(context),
                  shadowed: false,
                  iconColor: LinkVaultColors.primary,
                  borderColor: LinkVaultColors.ink,
                ),
                const SizedBox(width: 12),
                SquareButton(
                  onPressed: () => context.go('/settings'),
                  icon: Icons.settings_outlined,
                  size: 45,
                  backgroundColor: LinkVaultThemeTokens.surface(context),
                  shadowed: false,
                  iconColor: LinkVaultColors.primary,
                  borderColor: LinkVaultColors.ink,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
