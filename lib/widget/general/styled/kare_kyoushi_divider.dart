import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKDivider extends StatelessWidget {
  final EdgeInsets padding;

  const KKDivider({
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        margin: padding,
        width: double.infinity,
        height: 1,
        decoration: BoxDecoration(color: theme.colorsTheme.stroke),
      ),
    );
  }
}
