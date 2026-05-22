part of 'collections_widgets.dart';

class _CollectionMetaBadge extends StatelessWidget {
  const _CollectionMetaBadge({required this.label, this.filled = false});

  final String label;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: filled ? ink : Colors.transparent,
        border: filled ? null : Border.all(color: ink),
        borderRadius: LinkVaultThemeTokens.componentRadius,
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: filled
              ? LinkVaultThemeTokens.onInk(context)
              : LinkVaultThemeTokens.secondaryInk(context),
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
