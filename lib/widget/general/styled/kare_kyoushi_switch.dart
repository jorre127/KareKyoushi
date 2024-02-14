import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const KKSwitch({
    required this.value,
    required this.onChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorsTheme.accent,
        inactiveTrackColor: theme.colorsTheme.disabled,
      ),
    );
  }
}
