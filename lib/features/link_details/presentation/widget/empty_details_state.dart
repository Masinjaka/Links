part of 'link_details_widgets.dart';

class EmptyDetailsState extends StatelessWidget {
  const EmptyDetailsState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LinkVaultThemeTokens.background(context),
      body: Stack(
        children: [
          const Positioned.fill(
            child: IgnorePointer(child: VelocityKineticBackground()),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    linkVaultLocalizationsOf(context).noLinkSelected,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: LinkVaultColors.primary,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    linkVaultLocalizationsOf(context).chooseLinkOrAdd,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: LinkVaultColors.secondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
