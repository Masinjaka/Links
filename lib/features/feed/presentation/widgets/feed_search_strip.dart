import 'package:flutter/material.dart';
import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';

class FeedSearchStrip extends StatelessWidget {
  const FeedSearchStrip({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        // border: Border.all(color: ink),
        // boxShadow: [
        //   BoxShadow(color: _feedInk, offset: Offset(3, 3), blurRadius: 0),
        // ],
        borderRadius: LinkVaultThemeTokens.componentRadius,
      ),
      child: Row(
        children: [
          Icon(Icons.search_rounded, color: ink, size: 32),
          const SizedBox(width: 16),
          Expanded(
            child: TextField(
              cursorColor: LinkVaultColors.primary,
              onTapOutside: (_) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              onChanged: (value) {
                onChanged(value);
              },
              style: textTheme.bodyLarge?.copyWith(
                color: ink,
                fontWeight: FontWeight.w600,
              ),
              decoration: InputDecoration(hintText: 'SEARCH'.displayText),
            ),
          ),
        ],
      ),
    );
  }
}
