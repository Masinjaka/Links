import 'package:flutter/material.dart';

import 'package:linkvault/features/feed/repository/link_entities.dart';

String? linkPreviewImageUrl(LinkWithTags link) {
  return link.preview?.imageUrl ?? link.link.sourceImageUrl;
}

String compactLinkUrl(String rawUrl) {
  final uri = Uri.tryParse(rawUrl);
  if (uri == null || uri.host.isEmpty) {
    return rawUrl.replaceFirst(RegExp(r'^https?://'), '');
  }

  final host = uri.host.replaceFirst(RegExp(r'^www\.'), '');
  final path = uri.path == '/' ? '' : uri.path;
  return '$host$path';
}

String addedDateLabel(BuildContext context, DateTime createdAt) {
  final formatted = MaterialLocalizations.of(
    context,
  ).formatMediumDate(createdAt);
  return formatted.toLowerCase();
}
