part of 'collection_details_widgets.dart';

class _SelectableCollectionLinkRow extends StatefulWidget {
  const _SelectableCollectionLinkRow({
    required this.link,
    required this.selected,
    required this.onToggle,
  });

  final LinkWithTags link;
  final bool selected;
  final VoidCallback onToggle;

  @override
  State<_SelectableCollectionLinkRow> createState() =>
      _SelectableCollectionLinkRowState();
}

class _SelectableCollectionLinkRowState
    extends State<_SelectableCollectionLinkRow> {
  static const _releaseDelay = Duration(milliseconds: 70);
  var _pressed = false;

  Future<void> _releasePressed() async {
    await Future<void>.delayed(_releaseDelay);
    if (!mounted) {
      return;
    }

    setState(() {
      _pressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);
    final selectionBorderColor = brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Material(
          color: Colors.transparent,
          borderRadius: LinkVaultThemeTokens.componentRadius,
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onToggle,
            borderRadius: LinkVaultThemeTokens.componentRadius,
            onTapDown: (_) {
              setState(() {
                _pressed = true;
              });
            },
            onTapUp: (_) {
              _releasePressed();
            },
            onTapCancel: () {
              _releasePressed();
            },
            child: TweenAnimationBuilder<double>(
              tween: Tween<double>(end: widget.selected ? 1 : 0),
              duration: const Duration(milliseconds: 420),
              curve: Curves.easeOutCubic,
              builder: (context, progress, child) {
                return CustomPaint(
                  foregroundPainter: _SelectionBorderPainter(
                    progress: progress,
                    color: selectionBorderColor,
                  ),
                  child: child,
                );
              },
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: surface,
                  borderRadius: LinkVaultThemeTokens.componentRadius,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.link.link.title.displayText,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(
                              context,
                            ).textTheme.titleMedium?.copyWith(color: ink),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.link.link.url.replaceFirst(
                              RegExp(r'^https?://'),
                              '',
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: LinkVaultColors.secondary),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Icon(
                      widget.selected
                          ? Icons.remove_rounded
                          : Icons.add_rounded,
                      color: widget.selected ? ink : LinkVaultColors.primary,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
        .animate(target: _pressed ? 1 : 0)
        .scaleXY(end: .96, duration: 110.ms, curve: Curves.easeOutCubic);
  }
}
