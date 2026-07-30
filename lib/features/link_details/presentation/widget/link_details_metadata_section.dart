part of 'link_details_widgets.dart';

class LinkDetailsMetadataSection extends StatelessWidget {
  const LinkDetailsMetadataSection({super.key, required this.link});

  final LinkWithTags link;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final surface = LinkVaultThemeTokens.surface(context);
    final ink = LinkVaultThemeTokens.ink(context);
    final readingTime = link.link.readingTime.trim();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          linkVaultLocalizationsOf(context).autoSummary,
          style: theme.textTheme.labelLarge?.copyWith(
            fontFamily: 'OpenSans',
            color: ink,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 24),
        VelocityPanel(
          padding: const EdgeInsets.all(20),
          borderColor: LinkVaultColors.ink,
          backgroundColor: surface,
          child: Text(
            link.link.description,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontSize: 16,
              height: 1.65,
            ),
          ),
        ),
        const SizedBox(height: 45),
        Text(
          linkVaultLocalizationsOf(context).metadataTags,
          style: theme.textTheme.headlineMedium?.copyWith(
            color: LinkVaultColors.secondary,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (final tag in link.tags)
              VelocityChip(label: tag.name, icon: Icons.tag_rounded),
            VelocityChip(
              label: linkVaultLocalizationsOf(context).addedOn(link.savedDate),
              icon: Icons.history_rounded,
            ),
            if (readingTime.isNotEmpty)
              VelocityChip(label: readingTime, icon: Icons.schedule_rounded),
          ],
        ),
      ],
    );
  }
}
