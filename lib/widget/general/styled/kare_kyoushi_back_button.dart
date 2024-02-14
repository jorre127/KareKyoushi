import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/keys.dart';
import 'package:kare_kyoushi/widget/general/action/action_item.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKBackButton extends StatelessWidget {
  final VoidCallback? onClick;
  final bool fullScreen;
  final bool isLight;

  const KKBackButton.light({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = true;

  const KKBackButton.dark({
    required this.onClick,
    this.fullScreen = false,
    super.key,
  }) : isLight = false;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => ActionItem(
        key: Keys.backButton,
        svgAsset: getCorrectIcon(context),
        color: isLight ? ThemeColors.white : theme.colorsTheme.primary,
        onClick: onClick,
      ),
    );
  }

  String getCorrectIcon(BuildContext context) {
    if (fullScreen) {
      return ThemeAssets.closeIcon(context);
    }
    return ThemeAssets.backIcon(context);
  }
}
