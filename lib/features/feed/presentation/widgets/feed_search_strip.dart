import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class FeedSearchStrip extends StatelessWidget {
  const FeedSearchStrip({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);
    final localizations = linkVaultLocalizationsOf(context);

    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded, color: ink, size: 21),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onChanged: (value) {
                onChanged(value);
              },
              style: textTheme.bodyLarge?.copyWith(color: ink),
              decoration: InputDecoration(hintText: localizations.search),
            ),
          ),
        ],
      ),
    );
  }
}
