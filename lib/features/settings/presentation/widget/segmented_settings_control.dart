part of 'settings_widgets.dart';

class SegmentedSettingsControl<T> extends StatefulWidget {
  const SegmentedSettingsControl({
    super.key,
    required this.selected,
    required this.options,
    required this.onSelected,
    this.selectedFillColor,
    this.selectedForegroundColor,
  });

  final T selected;
  final List<(T, String)> options;
  final ValueChanged<T> onSelected;
  final Color Function(T value)? selectedFillColor;
  final Color Function(T value)? selectedForegroundColor;

  @override
  State<SegmentedSettingsControl<T>> createState() =>
      _SegmentedSettingsControlState<T>();
}

class _SegmentedSettingsControlState<T>
    extends State<SegmentedSettingsControl<T>>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  int get _selectedIndex {
    final index = widget.options.indexWhere(
      (option) => option.$1 == widget.selected,
    );
    return index < 0 ? 0 : index;
  }

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: widget.options.length,
      vsync: this,
      initialIndex: _selectedIndex,
    );
  }

  @override
  void didUpdateWidget(covariant SegmentedSettingsControl<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.options.length != widget.options.length) {
      _controller.dispose();
      _controller = TabController(
        length: widget.options.length,
        vsync: this,
        initialIndex: _selectedIndex,
      );
      return;
    }

    final targetIndex = _selectedIndex;
    if (_controller.index != targetIndex) {
      _controller.animateTo(targetIndex);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final surface = LinkVaultThemeTokens.surface(context);
    final background = LinkVaultThemeTokens.background(context);
    final ink = LinkVaultThemeTokens.ink(context);
    final selectedValue = widget.options[_controller.index].$1;
    final unselectedBackground =
        Color.lerp(
          surface,
          brightness == Brightness.dark ? ink : background,
          brightness == Brightness.dark ? .12 : .65,
        ) ??
        surface;

    return SizedBox(
      height: 46,
      child: Container(
        decoration: BoxDecoration(
          color: unselectedBackground,
          borderRadius: LinkVaultThemeTokens.componentRadius,
        ),
        child: TabBar(
          controller: _controller,
          onTap: (index) => widget.onSelected(widget.options[index].$1),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorAnimation: TabIndicatorAnimation.elastic,
          labelPadding: EdgeInsets.zero,
          splashBorderRadius: LinkVaultThemeTokens.componentRadius,
          indicator: BoxDecoration(
            color:
                widget.selectedFillColor?.call(selectedValue) ??
                LinkVaultColors.primary,
            borderRadius: LinkVaultThemeTokens.componentRadius,
          ),
          labelColor:
              widget.selectedForegroundColor?.call(selectedValue) ??
              LinkVaultColors.onPrimary,
          unselectedLabelColor: ink,
          labelStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 13),
          unselectedLabelStyle: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontSize: 13),
          tabs: [for (final option in widget.options) Tab(text: option.$2)],
        ),
      ),
    );
  }
}
