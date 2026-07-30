import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/add_link/domain/tag_name_normalizer.dart';
import 'package:linkvault/features/add_link/presentation/widget/add_link_tag_choice_chip.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/formatters/display_text.dart';
import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

Future<void> showAddLinkTagsSheet({
  required BuildContext context,
  required List<String> availableTags,
  required Set<String> selectedTags,
  required TextEditingController controller,
  required ValueChanged<String> onAdd,
  required ValueChanged<String> onToggle,
  bool singleSelection = false,
}) {
  return showModalBottomSheet<void>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: .55,
        child: AddLinkTagsSheet(
          availableTags: availableTags,
          selectedTags: selectedTags,
          controller: controller,
          onAdd: onAdd,
          onToggle: onToggle,
          singleSelection: singleSelection,
        ),
      );
    },
  );
}

class AddLinkTagsSheet extends StatefulWidget {
  const AddLinkTagsSheet({
    super.key,
    required this.availableTags,
    required this.selectedTags,
    required this.controller,
    required this.onAdd,
    required this.onToggle,
    this.singleSelection = false,
  });

  final List<String> availableTags;
  final Set<String> selectedTags;
  final TextEditingController controller;
  final ValueChanged<String> onAdd;
  final ValueChanged<String> onToggle;
  final bool singleSelection;

  @override
  State<AddLinkTagsSheet> createState() => _AddLinkTagsSheetState();
}

class _AddLinkTagsSheetState extends State<AddLinkTagsSheet> {
  late final _selected = {...widget.selectedTags};
  final _added = <String>{};
  var _query = '';

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final tags = {...widget.availableTags, ..._added}.where(_matches).toList();
    return Material(
      key: const Key('add-link-tags-sheet'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 32, 20 + bottomInset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 6,
                decoration: BoxDecoration(
                  color: LinkVaultThemeTokens.surface(context),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Row(
              children: [
                Text(
                  linkVaultLocalizationsOf(context).addTags,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const Spacer(),
                TextButton(
                  key: const Key('add-link-tags-done'),
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(
                    foregroundColor: LinkVaultColors.primary,
                  ),
                  child: Text(linkVaultLocalizationsOf(context).done),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _searchField(context),
            const SizedBox(height: 28),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 8,
                  runSpacing: 12,
                  children: [
                    for (final tag in tags)
                      AddLinkTagChoiceChip(
                        tag: tag,
                        selected: _selected.contains(tag),
                        onTap: () => _toggleTag(tag),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return LibraryPillTextField(
      controller: widget.controller,
      fieldKey: const Key('add-link-tag-text-field'),
      hintText: linkVaultLocalizationsOf(context).searchOrAddTag,
      autofocus: true,
      unfocusOnTapOutside: false,
      textInputAction: TextInputAction.done,
      onChanged: (value) => setState(() => _query = value),
      onSubmitted: (_) => _addTag(),
      fontSize: 12,
      trailing: Material(
        color: LinkVaultColors.primary,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          key: const Key('add-link-tag-add-button'),
          onTap: _addTag,
          child: const SizedBox.square(
            dimension: 20,
            child: Icon(Icons.add_rounded, color: Colors.white, size: 15),
          ),
        ),
      ),
    );
  }

  void _addTag() {
    final rawValue = widget.controller.text;
    final tag = normalizeTagName(rawValue);
    if (tag == null) return;
    setState(() {
      _added.add(tag);
      _selected.add(tag);
      _query = '';
    });
    widget.onAdd(rawValue);
  }

  void _toggleTag(String tag) {
    setState(() {
      if (_selected.contains(tag)) {
        _selected.remove(tag);
      } else {
        if (widget.singleSelection) _selected.clear();
        _selected.add(tag);
      }
    });
    widget.onToggle(tag);
  }

  bool _matches(String tag) {
    return _query.trim().isEmpty ||
        tag.sentenceDisplayText.toLowerCase().contains(_query.toLowerCase());
  }
}
