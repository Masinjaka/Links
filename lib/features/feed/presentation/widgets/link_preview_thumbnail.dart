import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LinkPreviewThumbnail extends StatelessWidget {
  const LinkPreviewThumbnail({super.key, this.imageUrl});

  static const size = 100.0;

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();

    return Container(
      key: const Key('link-preview-thumbnail'),
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.background(context),
        borderRadius: BorderRadius.circular(18),
      ),
      child: url == null || url.isEmpty
          ? _fallback(context)
          : CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 120),
              placeholder: (_, _) => _fallback(context),
              errorWidget: (_, _, _) => _fallback(context),
            ),
    );
  }

  Widget _fallback(BuildContext context) {
    return Icon(
      Icons.public_rounded,
      color: LinkVaultThemeTokens.secondaryInk(context),
      size: 30,
    );
  }
}
