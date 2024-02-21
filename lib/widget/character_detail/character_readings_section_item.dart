import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/svg_icon.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterReadingsSectionItem extends StatelessWidget {
  final Color selectedColor;
  final String reading;
  final String? selectedReading;
  final bool showClose;
  final ValueChanged<String> onReadingTapped;

  const CharacterReadingsSectionItem({
    required this.reading,
    required this.selectedReading,
    required this.onReadingTapped,
    required this.selectedColor,
    this.showClose = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedReading == reading;
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedBack(
        onClick: () => onReadingTapped(reading),
        borderRadius: ThemeDimens.tagBorderRadius,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color: isSelected ? selectedColor : theme.colorsTheme.bgDefault,
            borderRadius: ThemeDimens.tagBorderRadius,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                reading,
                style: isSelected ? theme.textThemes.coreTextTheme.copyXtraSubtle.copyWith(height: 1) : theme.textThemes.subtleTextTheme.copyXtraSubtle.copyWith(height: 1),
              ),
              if (showClose) ...[
                const SizedBox(width: 8),
                SvgIcon(
                  svgAsset: ThemeAssets.crossIcon,
                  size: ThemeDimens.smallIcon,
                  color: theme.colorsTheme.inverseIcon,
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
