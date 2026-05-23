import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/meta_badge_widget.dart';

class KineticLinkCard extends StatefulWidget {
  const KineticLinkCard({
    super.key,
    required this.link,
    this.onOpen,
    this.trailing,
    this.leading,
    this.selected = false,
  });

  final LinkWithTags link;
  final VoidCallback? onOpen;
  final Widget? trailing;
  final Widget? leading;
  final bool selected;

  @override
  State<KineticLinkCard> createState() => _KineticLinkCardState();
}

class _KineticLinkCardState extends State<KineticLinkCard> {
  static const _cardHeight = 200.0;
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
    final titleSize = textTheme.labelLarge?.fontSize;

    return SizedBox(
          height: _cardHeight,
          child: Container(
            decoration: BoxDecoration(
              color: LinkVaultThemeTokens.surface(context),
              // border: Border.all(
              //   color: widget.selected ? LinkVaultColors.primary : ink,
              //   width: widget.selected ? 2 : 0.5,
              // ),
              // boxShadow: [
              //   BoxShadow(color: _feedInk, offset: Offset(3, 3), blurRadius: 0),
              // ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: LinkVaultThemeTokens.componentRadius,
              clipBehavior: Clip.antiAlias,
              child: InkWell(
                onTap: widget.onOpen,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.leading != null) ...[
                            widget.leading!,
                            const SizedBox(width: 14),
                          ],
                          Expanded(
                            child: Text(
                              widget.link.link.title.toUpperCase().displayText,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.openSans(
                                textStyle: textTheme.labelLarge,
                                color: ink,
                                fontSize: titleSize,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                          if (widget.trailing != null) ...[
                            const SizedBox(width: 16),
                            widget.trailing!,
                          ],
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        widget.link.link.url.replaceFirst(
                          RegExp(r'^https?://'),
                          '',
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyLarge?.copyWith(
                          color: LinkVaultThemeTokens.secondaryInk(context),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 16,
                        runSpacing: 10,
                        children: [
                          MetaBadge(
                            label: widget.link.primaryTag,
                            filled: true,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            fontSize: 12,
                          ),
                          MetaBadge(
                            label: 'SAVED ${widget.link.savedDate}',
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 7,
                            ),
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
        .animate(target: _pressed ? 1 : 0)
        .scaleXY(end: .96, duration: 110.ms, curve: Curves.easeOutCubic);
  }
}
