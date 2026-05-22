import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/provider/add_link_metadata_providers.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_widgets.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/shared/presentation/widgets/velocity_widgets.dart';

class AddLinkPage extends ConsumerStatefulWidget {
  const AddLinkPage({super.key, this.linkId, this.collectionId});

  final int? linkId;
  final int? collectionId;

  @override
  ConsumerState<AddLinkPage> createState() => _AddLinkPageState();
}

class _AddLinkPageState extends ConsumerState<AddLinkPage> {
  static const _suggestedTags = [
    'DESIGN',
    'DEV',
    'RESEARCH',
    'ARCHIVE',
    'UTILITY',
  ];

  final _urlController = TextEditingController();
  final _tagController = TextEditingController();
  final _tags = <String>{'DESIGN', 'UTILITY'};
  var _saving = false;
  int? _hydratedLinkId;

  @override
  void dispose() {
    _urlController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urlDraft = ref.watch(addLinkUrlDraftProvider);
    final livePreview = ref.watch(addLinkLivePreviewProvider);
    final hasUrlDraft = urlDraft.trim().isNotEmpty;
    final persistedTags =
        ref.watch(addLinkAvailableTagsProvider).value ?? const [];
    final editingLink = ref.watch(addLinkEditingLinkProvider(widget.linkId));
    final availableTags = {
      ..._suggestedTags,
      ...persistedTags,
      ..._tags,
    }.toList(growable: false);
    final headerToTitleGap = 48.0;
    final titleToUrlFieldGap = 25.0;
    final urlFieldToPreviewGap = 24.0;
    final previewToTagsGap = 40.0;
    final urlFieldToTagsGap = 40.0;
    final tagsToButtonGap = 48.0;

    editingLink.whenData((link) {
      if (link == null || _hydratedLinkId == link.link.id) {
        return;
      }

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted || _hydratedLinkId == link.link.id) {
          return;
        }

        setState(() {
          _urlController.text = link.link.url;
          _tags
            ..clear()
            ..addAll(link.tags.map((tag) => tag.name));
          _hydratedLinkId = link.link.id;
        });
        ref.read(addLinkUrlDraftProvider.notifier).update(link.link.url);
      });
    });

    return VelocityPage(
      showAccentSquare: true,
      spacing: 0,
      children: [
        AddLinkPageHeader(
          onBack: () => _navigateBack(context),
          label: widget.linkId == null ? 'INPUT_v0.1' : 'EDIT_v0.1',
        ),
        SizedBox(height: headerToTitleGap),
        AddLinkTitleBlock(
          title: widget.linkId == null ? 'PASTE_URL' : 'EDIT_LINK',
        ),
        SizedBox(height: titleToUrlFieldGap),
        VelocityTextInput(
          key: const Key('add-link-url-input'),
          hint: 'HTTPS://YOUR_LINK...',
          icon: Icons.link_rounded,
          height: 84,
          borderColor: LinkVaultColors.ink,
          backgroundColor: LinkVaultThemeTokens.surface(context),
          fieldKey: const Key('add-link-url-text-field'),
          controller: _urlController,
          onChanged: (value) {
            ref.read(addLinkUrlDraftProvider.notifier).update(value);
          },
        ),
        if (hasUrlDraft) ...[
          SizedBox(height: urlFieldToPreviewGap),
          AddLinkMetadataPreview(preview: livePreview, rawUrl: urlDraft),
          SizedBox(height: previewToTagsGap),
        ] else
          SizedBox(height: urlFieldToTagsGap),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ASSIGN_TAGS',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(width: 120, height: 4, color: const Color(0xFFFF003D)),
            const SizedBox(height: 32),
            Text(
              'NEW_TAG',
              style: TextStyle(
                color: LinkVaultThemeTokens.ink(context),
                fontFamily: GoogleFonts.manrope().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            VelocityTextInput(
              key: const Key('add-link-tag-input'),
              hint: 'ENTER_KEYWORD...',
              borderColor: LinkVaultColors.ink,
              fieldKey: const Key('add-link-tag-text-field'),
              controller: _tagController,
              onSubmitted: _handleAddTag,
              trailing: TextButton(
                key: const Key('add-link-new-tag-button'),
                onPressed: () => _handleAddTag(_tagController.text),
                style: TextButton.styleFrom(
                  foregroundColor: LinkVaultColors.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text('ADD'),
              ),
            ),
            const SizedBox(height: 32),
            Wrap(
              spacing: 16,
              runSpacing: 18,
              children: [
                for (final tag in availableTags)
                  VelocityChip(
                    label: tag,
                    selected: _tags.contains(tag),
                    showClose: _tags.contains(tag),
                    onTap: () {
                      setState(() {
                        _tags.contains(tag)
                            ? _tags.remove(tag)
                            : _tags.add(tag);
                      });
                    },
                  ),
              ],
            ),
          ],
        ),
        SizedBox(height: tagsToButtonGap),
        VelocityButton(
          label: _saving
              ? (widget.linkId == null ? 'SAVING...' : 'UPDATING...')
              : (widget.linkId == null ? 'SAVE_LINK' : 'UPDATE_LINK'),
          icon: Icons.arrow_forward_rounded,
          onPressed: _saving ? null : _save,
        ),
      ],
    );
  }

  void _navigateBack(BuildContext context) {
    final editingId = widget.linkId;
    final collectionId = widget.collectionId;
    if (editingId != null && collectionId != null) {
      context.go('/details?id=$editingId&collectionId=$collectionId');
      return;
    }

    context.go('/');
  }

  void _handleAddTag(String rawValue) {
    final tag = _normalizeTag(rawValue);
    if (tag == null) {
      return;
    }

    setState(() {
      _tags.add(tag);
      _tagController.clear();
    });

    ref.read(addLinkOptimisticTagsProvider.notifier).add(tag);
    unawaited(_persistTag(tag));
  }

  Future<void> _persistTag(String tag) async {
    try {
      await ref.read(addLinkRepositoryProvider).ensureTagExists(tag);
    } catch (_) {
      if (!mounted) {
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('TAG_SAVE_FAILED')));
    }
  }

  String? _normalizeTag(String rawValue) {
    final trimmed = rawValue.trim();
    if (trimmed.isEmpty) {
      return null;
    }

    final normalized = trimmed
        .replaceAll(RegExp(r'\s+'), '_')
        .replaceAll(RegExp(r'[^A-Za-z0-9_]+'), '')
        .toUpperCase();

    return normalized.isEmpty ? null : normalized;
  }

  Future<void> _save() async {
    setState(() => _saving = true);
    try {
      final previewState = ref.read(addLinkLivePreviewProvider);
      final preview = switch (previewState) {
        AsyncData(:final value) => value,
        _ => null,
      };
      final repository = ref.read(addLinkRepositoryProvider);
      final draft = LinkDraft(
        url: _urlController.text.trim().isEmpty
            ? 'https://your_link...'
            : _urlController.text,
        tags: _tags.toList(growable: false),
      );
      final editingId = widget.linkId;
      late final int linkId;
      if (editingId == null) {
        linkId = await repository.create(draft, metadata: preview);
      } else {
        await repository.update(editingId, draft, metadata: preview);
        linkId = editingId;
      }
      if (mounted) {
        if (widget.collectionId != null) {
          context.go('/details?id=$linkId&collectionId=${widget.collectionId}');
        } else {
          context.go('/details?id=$linkId');
        }
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }
}
