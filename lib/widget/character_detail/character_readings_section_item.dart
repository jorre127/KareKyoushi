import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterReadingsSectionItem extends StatelessWidget {
  final String reading;

  const CharacterReadingsSectionItem({
    required this.reading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgDefault,
          borderRadius: ThemeDimens.tagBorderRadius,
        ),
        child: Text(
          reading,
          style: theme.textThemes.subtleTextTheme.copyXtraSubtle.copyWith(height: 1),
        ),
      ),
    );
  }
}
