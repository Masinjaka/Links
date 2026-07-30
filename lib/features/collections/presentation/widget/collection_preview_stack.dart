import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_catalog.dart';

class CollectionPreviewStack extends StatelessWidget {
  const CollectionPreviewStack({
    super.key,
    required this.iconKey,
    this.imageUrls = const [],
  });

  static const size = Size(103, 84);
  static const _tileSize = Size.square(68);
  static const _leftOffsets = [29.5, 17.5, 5.5];
  static const _topOffsets = [8.0, 0.0, 8.0];
  static const _tenDegrees = 10 * math.pi / 180;
  static const _angles = [_tenDegrees, 0.0, -_tenDegrees];

  final String iconKey;
  final List<String?> imageUrls;

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      key: const Key('collection-preview-stack'),
      size: size,
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          for (var slot = 2; slot >= 0; slot--)
            Positioned(
              left: _leftOffsets[slot],
              top: _topOffsets[slot],
              child: Transform.rotate(
                key: Key('collection-preview-rotation-$slot'),
                angle: _angles[slot],
                child: _PreviewTile(
                  slot: slot,
                  iconKey: iconKey,
                  imageUrl: slot < imageUrls.length ? imageUrls[slot] : null,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PreviewTile extends StatelessWidget {
  const _PreviewTile({
    required this.slot,
    required this.iconKey,
    required this.imageUrl,
  });

  final int slot;
  final String iconKey;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final url = imageUrl?.trim();
    return Container(
      key: Key('collection-preview-slot-$slot'),
      width: CollectionPreviewStack._tileSize.width,
      height: CollectionPreviewStack._tileSize.height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: _placeholderColor(context),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: LinkVaultThemeTokens.surface(context),
          width: 1,
        ),
      ),
      child: url == null || url.isEmpty
          ? _placeholder(context)
          : CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 120),
              placeholder: (_, _) => _placeholder(context),
              errorWidget: (_, _, _) => _placeholder(context),
            ),
    );
  }

  Widget _placeholder(BuildContext context) {
    return ColoredBox(
      color: _placeholderColor(context),
      child: Center(
        child: Icon(
          collectionIconForKey(iconKey),
          color: LinkVaultThemeTokens.secondaryInk(context),
          size: 20,
        ),
      ),
    );
  }

  Color _placeholderColor(BuildContext context) {
    return Color.alphaBlend(
      LinkVaultThemeTokens.ink(context).withValues(alpha: .08),
      LinkVaultThemeTokens.surface(context),
    );
  }
}
