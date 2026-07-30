import 'package:flutter/material.dart';

import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

class AddLinkUrlField extends StatelessWidget {
  const AddLinkUrlField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return LibraryPillTextField(
      controller: controller,
      fieldKey: const Key('add-link-url-text-field'),
      hintText: linkVaultLocalizationsOf(context).linkUrlHint,
      height: 52,
      onChanged: onChanged,
      keyboardType: TextInputType.url,
      textInputAction: TextInputAction.next,
      autocorrect: false,
      enableSuggestions: false,
    );
  }
}
