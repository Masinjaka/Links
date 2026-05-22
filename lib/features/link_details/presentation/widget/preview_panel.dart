part of 'link_details_widgets.dart';

final BaseCacheManager _previewImageCacheManager = CacheManager(
  Config(
    'linkPreviewImages',
    repo: JsonCacheInfoRepository(databaseName: 'linkPreviewImages'),
  ),
);

class PreviewPanel extends StatelessWidget {
  const PreviewPanel({super.key, required this.link});

  final LinkWithTags link;

  @override
  Widget build(BuildContext context) {
    final previewImageUrl = link.preview?.imageUrl ?? link.link.sourceImageUrl;

    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(12),
      child: VelocityPanel(
        borderColor: LinkVaultColors.onPrimary,
        redRight: false,
        redBottom: false,
        padding: EdgeInsets.zero,
        child: AspectRatio(
          aspectRatio: 1.75,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: previewImageUrl!,
                  cacheManager: _previewImageCacheManager,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return CustomPaint(painter: _PreviewPainter());
                  },
                ),
              ),
              const Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Color(0xB3000000)],
                      stops: [0.45, 1],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PreviewPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(
      Offset.zero & size,
      Paint()..color = const Color(0xFF202733),
    );

    final mortar = Paint()
      ..color = const Color(0xFF394353).withValues(alpha: .5);
    for (var y = 0.0; y < size.height; y += 34) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), mortar);
    }
    for (var x = 0.0; x < size.width; x += 92) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), mortar);
    }

    canvas.drawPath(
      Path()
        ..moveTo(size.width * .34, 0)
        ..lineTo(size.width * .86, 0)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width * .55, size.height)
        ..close(),
      Paint()..color = LinkVaultColors.primary.withValues(alpha: .72),
    );
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height * .48)
        ..lineTo(size.width * .14, size.height)
        ..lineTo(0, size.height)
        ..close(),
      Paint()..color = LinkVaultColors.onPrimary,
    );
    canvas.drawPath(
      Path()
        ..moveTo(size.width * .78, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, size.height * .24)
        ..close(),
      Paint()..color = LinkVaultColors.onPrimary,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
