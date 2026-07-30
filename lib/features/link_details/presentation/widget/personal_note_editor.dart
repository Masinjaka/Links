import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class PersonalNoteEditor extends StatefulWidget {
  const PersonalNoteEditor({
    super.key,
    required this.initialNote,
    required this.onSave,
  });

  final String initialNote;
  final ValueChanged<String> onSave;

  @override
  State<PersonalNoteEditor> createState() => _PersonalNoteEditorState();
}

class _PersonalNoteEditorState extends State<PersonalNoteEditor> {
  late final _controller = TextEditingController(text: widget.initialNote);
  late final _focusNode = FocusNode()..addListener(_saveOnBlur);

  @override
  void didUpdateWidget(PersonalNoteEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialNote != widget.initialNote &&
        _controller.text != widget.initialNote) {
      _controller.text = widget.initialNote;
    }
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_saveOnBlur)
      ..dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ink = Theme.of(context).colorScheme.onSurface;
    return Container(
      height: 104,
      padding: const EdgeInsets.fromLTRB(16, 13, 12, 8),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            linkVaultLocalizationsOf(context).note,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w800),
          ),
          Expanded(
            child: TextField(
              key: const Key('link-details-note'),
              controller: _controller,
              focusNode: _focusNode,
              expands: true,
              minLines: null,
              maxLines: null,
              cursorColor: ink,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: ink, fontSize: 12),
              onTapOutside: (_) {
                _focusNode.unfocus();
              },
              decoration: InputDecoration(
                hintText: linkVaultLocalizationsOf(context).addNote,
                hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: LinkVaultThemeTokens.secondaryInk(context),
                ),
                isCollapsed: true,
                contentPadding: const EdgeInsets.only(top: 8),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveOnBlur() {
    if (!_focusNode.hasFocus && _controller.text != widget.initialNote) {
      widget.onSave(_controller.text);
    }
  }
}
