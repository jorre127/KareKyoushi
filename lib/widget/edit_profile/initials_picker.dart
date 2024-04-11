import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/user/user_avatar.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class InitialsPicker extends StatelessWidget {
  final String userName;
  final ValueChanged<Color> onColorTapped;
  final Color? selectedColor;

  static const _colors = [
    ThemeColors.bgDefault,
    ThemeColors.stroke,
    Colors.white,
    ThemeColors.copySubtle,
    ThemeColors.accent1,
    ThemeColors.accent2,
    ThemeColors.accent3,
    ThemeColors.accent4,
    ThemeColors.accent5,
    ThemeColors.accent6,
    ThemeColors.accent1Dark,
    ThemeColors.accent2Dark,
    ThemeColors.accent3Dark,
    ThemeColors.accent4Dark,
    ThemeColors.accent5Dark,
    ThemeColors.accent6Dark,
  ];

  const InitialsPicker({
    required this.userName,
    required this.onColorTapped,
    this.selectedColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgCard,
          borderRadius: BorderRadius.circular(44),
        ),
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8),
          crossAxisCount: 4,
          shrinkWrap: true,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: _colors
              .map((color) => Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: selectedColor == color
                            ? Border.all(
                                width: 4,
                                color: theme.colorsTheme.stroke,
                              )
                            : null),
                    child: UserAvatar(
                      name: userName,
                      color: color,
                      size: ThemeDimens.hugeIcon,
                      onTapped: () => onColorTapped(color),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
