import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/action/action_item.dart';
import 'package:kare_kyoushi/widget/general/user/user_avatar.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class ProfileHeader extends StatelessWidget {
  final String userName;
  final String? userPhoto;
  final Color? userColor;
  final VoidCallback onBackTapped;
  final VoidCallback onEditTapped;

  const ProfileHeader({
    required this.userName,
    required this.onBackTapped,
    required this.onEditTapped,
    required this.userColor,
    this.userPhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 24,
          bottom: 48,
        ),
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgCard,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(ThemeDimens.headerBorderRadiusValue)),
        ),
        child: SafeArea(
          bottom: false,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionItem(
                svgAsset: ThemeAssets.leftArrowIcon,
                onClick: onBackTapped,
                size: ThemeDimens.iconSize,
                color: theme.colorsTheme.icon,
              ),
              Expanded(
                child: Column(
                  children: [
                    UserAvatar(
                      name: userName,
                      photo: userPhoto,
                      size: ThemeDimens.hugeIcon,
                      color: userColor,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      userName,
                      style: theme.textThemes.coreTextTheme.titleHeader,
                    ),
                  ],
                ),
              ),
              ActionItem(
                svgAsset: ThemeAssets.editIcon,
                onClick: onEditTapped,
                size: ThemeDimens.iconSize,
                color: theme.colorsTheme.icon,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
