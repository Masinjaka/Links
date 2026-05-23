part of 'add_link_widgets.dart';

class AddLinkTitleBlock extends StatelessWidget {
  const AddLinkTitleBlock({super.key, required this.title});

  final String title;

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
      ],
    );
  }
}
