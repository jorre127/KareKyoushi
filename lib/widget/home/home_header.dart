import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/user/user_avatar.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class HomeHeader extends StatelessWidget {
  final String userName;
  final String? userPhoto;
  final VoidCallback onTapped;

  const HomeHeader({
    required this.userName,
    required this.onTapped,
    this.userPhoto,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgCard,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(ThemeDimens.headerBorderRadiusValue)),
        ),
        padding: const EdgeInsets.only(
          left: 36,
          right: 36,
          bottom: 32,
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: UserAvatar(
                  name: userName,
                  photo: userPhoto,
                  onTapped: onTapped,
                ),
              ),
              Text(
                localization.homeTitleName(userName),
                style: theme.textThemes.subtleTextTheme.copyDefault,
              ),
              Text(
                localization.homeTitleHiragana,
                style: theme.textThemes.coreTextTheme.titleHeader,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
