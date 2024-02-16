import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKLabel extends StatelessWidget {
  final String text;

  const KKLabel({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: ThemeDimens.tagBorderRadius,
          border: Border.all(color: theme.colorsTheme.stroke),
        ),
        child: Text(
          text,
          style: theme.textThemes.subtleTextTheme.copySubtle.copyWith(height: 1),
        ),
      ),
    );
  }
}
