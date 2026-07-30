import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';

class LibraryPillTextField extends StatelessWidget {
  const LibraryPillTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.fieldKey,
    this.height = 42,
    this.fontSize = 13,
    this.autofocus = false,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.unfocusOnTapOutside = true,
    this.keyboardType,
    this.textInputAction,
    this.trailing,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hintText;
  final Key? fieldKey;
  final double height;
  final double fontSize;
  final bool autofocus;
  final bool autocorrect;
  final bool enableSuggestions;
  final bool unfocusOnTapOutside;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final Widget? trailing;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final ink = LinkVaultThemeTokens.ink(context);
    final secondary = LinkVaultThemeTokens.secondaryInk(context);
    return Container(
      height: height,
      padding: EdgeInsets.only(right: trailing == null ? 0 : 10),
      decoration: BoxDecoration(
        color: LinkVaultThemeTokens.surface(context),
        borderRadius: BorderRadius.circular(height / 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: TextField(
              key: fieldKey,
              controller: controller,
              autofocus: autofocus,
              autocorrect: autocorrect,
              enableSuggestions: enableSuggestions,
              keyboardType: keyboardType,
              textInputAction: textInputAction,
              cursorColor: ink,
              expands: true,
              minLines: null,
              maxLines: null,
              textAlignVertical: TextAlignVertical.center,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              onTapOutside: unfocusOnTapOutside
                  ? (_) => FocusManager.instance.primaryFocus?.unfocus()
                  : null,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: ink,
                fontSize: fontSize,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: secondary, fontSize: fontSize),
                isCollapsed: true,
                contentPadding: const EdgeInsets.only(left: 16, right: 8),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          if (trailing != null) Center(child: trailing),
        ],
      ),
    );
  }
}
