import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:linkvault/app/linkvault_theme.dart';
import 'package:linkvault/core/database/app_database.dart';
import 'package:linkvault/features/feed/domain/advanced_feed_filters.dart';
import 'package:linkvault/features/feed/provider/feed_filter_providers.dart';
import 'package:linkvault/l10n/linkvault_localizations.dart';

Future<void> showFeedAdvancedFilters(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (_) => const FeedAdvancedFiltersSheet(),
  );
}

class FeedAdvancedFiltersSheet extends ConsumerWidget {
  const FeedAdvancedFiltersSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(advancedFeedFilterStateProvider);
    final notifier = ref.read(advancedFeedFilterStateProvider.notifier);
    final domains = ref.watch(feedDomainsProvider).value ?? const <String>[];
    final types = ref.watch(feedContentTypesProvider).value ?? const <String>[];
    final collections =
        ref.watch(feedCollectionsProvider).value ?? const <Collection>[];
    final localizations = linkVaultLocalizationsOf(context);

    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(
          24,
          8,
          24,
          MediaQuery.viewInsetsOf(context).bottom + 24,
        ),
        children: [
          Text(
            localizations.filterLinks,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String?>(
            initialValue: filters.domain,
            decoration: InputDecoration(labelText: localizations.domain),
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(localizations.anyDomain),
              ),
              for (final domain in domains)
                DropdownMenuItem(value: domain, child: Text(domain)),
            ],
            onChanged: notifier.setDomain,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<String?>(
            initialValue: filters.contentType,
            decoration: InputDecoration(labelText: localizations.contentType),
            items: [
              DropdownMenuItem(value: null, child: Text(localizations.anyType)),
              for (final type in types)
                DropdownMenuItem(value: type, child: Text(type)),
            ],
            onChanged: notifier.setContentType,
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<int?>(
            initialValue: filters.collectionId,
            decoration: InputDecoration(labelText: localizations.collection),
            items: [
              DropdownMenuItem(
                value: null,
                child: Text(localizations.anyCollection),
              ),
              for (final collection in collections)
                DropdownMenuItem(
                  value: collection.id,
                  child: Text(collection.title.toLowerCase()),
                ),
            ],
            onChanged: notifier.setCollection,
          ),
          const SizedBox(height: 12),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(localizations.availableOffline),
            value: filters.availableOffline ?? false,
            onChanged: (value) {
              notifier.setAvailableOffline(value ? true : null);
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(localizations.brokenLinks),
            value: filters.broken ?? false,
            onChanged: (value) => notifier.setBroken(value ? true : null),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _pickDate(context, notifier, filters, true),
                  child: Text(_dateLabel(context, 'from', filters.addedFrom)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _pickDate(context, notifier, filters, false),
                  child: Text(_dateLabel(context, 'to', filters.addedTo)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              TextButton(
                onPressed: notifier.clear,
                child: Text(localizations.clear),
              ),
              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.pop(context),
                style: FilledButton.styleFrom(
                  backgroundColor: LinkVaultThemeTokens.ink(context),
                ),
                child: Text(localizations.done),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _pickDate(
    BuildContext context,
    AdvancedFeedFilterState notifier,
    AdvancedFeedFilters filters,
    bool from,
  ) async {
    final selected = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
      initialDate:
          (from ? filters.addedFrom : filters.addedTo) ?? DateTime.now(),
    );
    if (selected == null) return;
    notifier.setDates(
      from ? selected : filters.addedFrom,
      from ? filters.addedTo : selected.add(const Duration(days: 1)),
    );
  }

  String _dateLabel(BuildContext context, String prefix, DateTime? value) {
    final localizations = linkVaultLocalizationsOf(context);
    if (value == null) {
      return prefix == 'from' ? localizations.fromDate : localizations.toDate;
    }
    final date = MaterialLocalizations.of(context).formatShortDate(value);
    return prefix == 'from'
        ? localizations.fromValue(date)
        : localizations.toValue(date);
  }
}
