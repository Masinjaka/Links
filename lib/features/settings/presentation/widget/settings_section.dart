part of 'settings_widgets.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final titleSize = textTheme.labelLarge?.fontSize;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.displayText,
          style: GoogleFonts.openSans(
            textStyle: textTheme.labelLarge,
            color: LinkVaultThemeTokens.ink(context),
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (final (index, child) in children.indexed) ...[
                child,
                if (index != children.length - 1) const SizedBox(height: 16),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
