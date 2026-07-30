import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/features/add_link/application/add_link_save_coordinator.dart';
import 'package:linkvault/features/add_link/domain/tag_name_normalizer.dart';
import 'package:linkvault/features/add_link/domain/normalized_url.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_body.dart';
import 'package:linkvault/features/add_link/presentation/widget/duplicate_bookmark_dialog.dart';
import 'package:linkvault/features/add_link/presentation/add_link_navigation.dart';
import 'package:linkvault/features/add_link/provider/add_link_metadata_providers.dart';
import 'package:linkvault/features/add_link/provider/add_link_providers.dart';
import 'package:linkvault/features/feed/repository/link_entities.dart';
import 'package:linkvault/features/collections/provider/collections_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddLinkPage extends ConsumerStatefulWidget {
  const AddLinkPage({
    super.key,
    this.linkId,
    this.collectionId,
    this.initialUrl,
    this.sheetMode = false,
  });
  final int? linkId;
  final int? collectionId;
  final String? initialUrl;
  final bool sheetMode;

  @override
  ConsumerState<AddLinkPage> createState() => _AddLinkPageState();
}

class _AddLinkPageState extends ConsumerState<AddLinkPage> {
  final _urlController = TextEditingController();
  final _tagController = TextEditingController();
  final _noteController = TextEditingController();
  final _tags = <String>{};
  int? _selectedCollectionId;
  var _saving = false;
  int? _hydratedLinkId;

  @override
  void initState() {
    super.initState();
    _selectedCollectionId = widget.collectionId;
    final initialUrl = widget.initialUrl?.trim();
    if (initialUrl == null || initialUrl.isEmpty) return;
    _urlController.text = initialUrl;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(addLinkUrlDraftProvider.notifier).update(initialUrl);
    });
  }

  @override
  void dispose() {
    _urlController.dispose();
    _tagController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final urlDraft = ref.watch(addLinkUrlDraftProvider);
    final livePreview = ref.watch(addLinkLivePreviewProvider);
    final persistedTags =
        ref.watch(addLinkAvailableTagsProvider).value ?? const [];
    final editingLink = ref.watch(addLinkEditingLinkProvider(widget.linkId));
    final collections = ref.watch(collectionsProvider).value ?? const [];
    final availableTags = {
      ...suggestedLinkTags,
      ...persistedTags,
      ..._tags,
    }.toList(growable: false);
    editingLink.whenData(_hydrateEditingLink);
    return AddLinkBody(
      isEditing: widget.linkId != null,
      isSaving: _saving,
      urlController: _urlController,
      tagController: _tagController,
      noteController: _noteController,
      urlDraft: urlDraft,
      preview: livePreview,
      availableTags: availableTags,
      selectedTags: _tags,
      collections: collections,
      selectedCollectionId: _selectedCollectionId,
      sheetMode: widget.sheetMode,
      onBack: () => closeAddLink(
        context,
        sheetMode: widget.sheetMode,
        editingId: widget.linkId,
        collectionId: widget.collectionId,
      ),
      onUrlChanged: (value) {
        ref.read(addLinkUrlDraftProvider.notifier).update(value);
      },
      onAddTag: _handleAddTag,
      onToggleTag: _toggleTag,
      onCollectionSelected: (id) {
        setState(() => _selectedCollectionId = id);
      },
      onSave: _saving ? null : _save,
    );
  }

  void _hydrateEditingLink(LinkWithTags? link) {
    if (link == null || _hydratedLinkId == link.link.id) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _hydratedLinkId == link.link.id) return;
      setState(() {
        _urlController.text = link.link.url;
        _noteController.text = link.link.note;
        _tags
          ..clear()
          ..addAll(link.tags.map((tag) => tag.name));
        _hydratedLinkId = link.link.id;
      });
      ref.read(addLinkUrlDraftProvider.notifier).update(link.link.url);
    });
  }

  void _toggleTag(String tag) {
    setState(() {
      _tags.contains(tag) ? _tags.remove(tag) : _tags.add(tag);
    });
  }

  void _handleAddTag(String rawValue) {
    final tag = normalizeTagName(rawValue);
    if (tag == null) return;

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
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(linkVaultLocalizationsOf(context).tagSaveFailed),
        ),
      );
    }
  }

  Future<void> _save() async {
    if (bookmarkUrlError(_urlController.text) != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(linkVaultLocalizationsOf(context).pasteValidLink),
        ),
      );
      return;
    }
    setState(() => _saving = true);
    try {
      final previewState = ref.read(addLinkLivePreviewProvider);
      final preview = switch (previewState) {
        AsyncData(:final value) => value,
        _ => null,
      };
      final draft = LinkDraft(
        url: _urlController.text,
        note: _noteController.text,
        tags: _tags.toList(growable: false),
        collectionIds: [?_selectedCollectionId],
      );
      final repository = ref.read(addLinkRepositoryProvider);
      final linkId = await AddLinkSaveCoordinator(repository).save(
        draft: draft,
        metadata: preview,
        editingId: widget.linkId,
        requestChoice: (duplicate) {
          return showDuplicateBookmarkDialog(context, duplicate);
        },
      );
      if (linkId == null) return;
      if (!mounted) return;
      completeAddLink(
        context,
        sheetMode: widget.sheetMode,
        linkId: linkId,
        collectionId: _selectedCollectionId,
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }
}
