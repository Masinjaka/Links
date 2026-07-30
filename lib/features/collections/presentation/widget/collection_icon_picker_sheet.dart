import 'package:flutter/material.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/features/collections/presentation/widget/collection_icon_catalog.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';
import 'package:linkvault/shared/presentation/widgets/library_pill_text_field.dart';

Future<String?> showCollectionIconPickerSheet({
  required BuildContext context,
  required String selectedIconKey,
}) {
  return showModalBottomSheet<String>(
    context: context,
    useRootNavigator: true,
    useSafeArea: false,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .36),
    builder: (_) {
      return FractionallySizedBox(
        heightFactor: .66,
        child: CollectionIconPickerSheet(selectedIconKey: selectedIconKey),
      );
    },
  );
}

class CollectionIconPickerSheet extends StatefulWidget {
  const CollectionIconPickerSheet({super.key, required this.selectedIconKey});

  final String selectedIconKey;

  @override
  State<CollectionIconPickerSheet> createState() =>
      _CollectionIconPickerSheetState();
}

class _CollectionIconPickerSheetState extends State<CollectionIconPickerSheet> {
  final _searchController = TextEditingController();
  late String _selectedIconKey = widget.selectedIconKey;
  var _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = linkVaultLocalizationsOf(context);
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final options = collectionIconOptions.where(_matches).toList();
    return Material(
      key: const Key('collection-icon-picker-sheet'),
      color: LinkVaultThemeTokens.background(context),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: EdgeInsets.fromLTRB(32, 10, 32, 16 + bottomInset),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _handle(context),
            const SizedBox(height: 22),
            _header(context),
            const SizedBox(height: 20),
            LibraryPillTextField(
              controller: _searchController,
              fieldKey: const Key('collection-icon-search'),
              hintText: localizations.searchIcon,
              fontSize: 12,
              unfocusOnTapOutside: false,
              onChanged: (value) => setState(() => _query = value),
            ),
            const SizedBox(height: 28),
            Expanded(
              child: options.isEmpty
                  ? Center(child: Text(localizations.noIconsFound))
                  : _grid(options),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handle(BuildContext context) {
    return Center(
      child: Container(
        width: 36,
        height: 6,
        decoration: BoxDecoration(
          color: LinkVaultThemeTokens.surface(context),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            linkVaultLocalizationsOf(context).selectIcons,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        TextButton(
          key: const Key('collection-icon-picker-done'),
          onPressed: () => Navigator.of(context).pop(_selectedIconKey),
          style: TextButton.styleFrom(foregroundColor: LinkVaultColors.primary),
          child: Text(linkVaultLocalizationsOf(context).done),
        ),
      ],
    );
  }

  Widget _grid(List<CollectionIconOption> options) {
    return GridView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.zero,
      itemCount: options.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        final option = options[index];
        final selected = option.key == _selectedIconKey;
        return Material(
          key: ValueKey('collection-icon-option-${option.key}'),
          color: selected
              ? LinkVaultThemeTokens.surface(context)
              : Colors.transparent,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () => setState(() => _selectedIconKey = option.key),
            customBorder: const CircleBorder(),
            child: Icon(
              option.icon,
              key: ValueKey('collection-icon-glyph-${option.key}'),
              size: 22,
              color: selected
                  ? LinkVaultColors.primary
                  : LinkVaultThemeTokens.secondaryInk(context, alpha: .8),
            ),
          ),
        );
      },
    );
  }

  bool _matches(CollectionIconOption option) {
    final query = _query.trim().toLowerCase();
    return query.isEmpty ||
        option.key.toLowerCase().contains(query) ||
        option.label.toLowerCase().contains(query);
  }
}
