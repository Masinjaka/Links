part of 'collections_widgets.dart';

class CollectionFeedCard extends StatefulWidget {
  const CollectionFeedCard({
    super.key,
    required this.group,
    this.onOpen,
    this.selectionMode = false,
    this.selected = false,
    this.onToggleSelection,
  });

  final CollectionWithCount group;
  final VoidCallback? onOpen;
  final bool selectionMode;
  final bool selected;
  final VoidCallback? onToggleSelection;

  @override
  State<CollectionFeedCard> createState() => _CollectionFeedCardState();
}

class _CollectionFeedCardState extends State<CollectionFeedCard> {
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
    final textTheme = Theme.of(context).textTheme;
    final ink = LinkVaultThemeTokens.ink(context);
    final onTap = widget.selectionMode
        ? widget.onToggleSelection
        : widget.onOpen;

    return Container(
          decoration: BoxDecoration(
            color: LinkVaultThemeTokens.surface(context),
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: LinkVaultThemeTokens.componentRadius,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              borderRadius: LinkVaultThemeTokens.componentRadius,
              onTapDown: onTap == null
                  ? null
                  : (_) {
                      setState(() {
                        _pressed = true;
                      });
                    },
              onTapUp: onTap == null
                  ? null
                  : (_) {
                      _releasePressed();
                    },
              onTapCancel: onTap == null
                  ? null
                  : () {
                      _releasePressed();
                    },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        if (widget.selectionMode) ...[
                          _CollectionSelectionCheckbox(
                            selected: widget.selected,
                          ),
                          const SizedBox(width: 12),
                        ],
                        Text(
                          '${widget.group.count}_LINKS',
                          style: textTheme.bodyLarge?.copyWith(
                            color: LinkVaultThemeTokens.secondaryInk(context),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              _collectionIcon(widget.group.collection.iconKey),
                              color: ink,
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.group.collection.title.toUpperCase(),
                      style: textTheme.headlineMedium?.copyWith(color: ink),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                    if (widget.group.collection.tagName.isNotEmpty)
                      Row(
                        children: [
                          Flexible(
                            child: _CollectionMetaBadge(
                              label: widget.group.collection.tagName,
                              filled: true,
                            ),
                          ),
                        ],
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

IconData _collectionIcon(String iconKey) {
  return collectionIconForKey(iconKey);
}
