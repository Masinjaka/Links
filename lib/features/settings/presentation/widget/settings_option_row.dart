part of 'settings_widgets.dart';

class SettingsOptionRow extends StatelessWidget {
  const SettingsOptionRow({
    super.key,
    required this.title,
    required this.control,
  });

  final String title;
  final Widget control;

  @override
  Widget build(BuildContext context) {
    final surface = LinkVaultThemeTokens.surface(context);
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: surface,
        borderRadius: LinkVaultThemeTokens.componentRadius,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Text(
                title.lowerDisplayText,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Align(alignment: Alignment.centerRight, child: control),
          ),
        ],
      ),
    );
  }
}
