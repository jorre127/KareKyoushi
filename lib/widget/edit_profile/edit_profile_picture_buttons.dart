import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/edit_profile/drop_painter.dart';
import 'package:kare_kyoushi/widget/edit_profile/edit_profile_picture_button.dart';
import 'package:kare_kyoushi/widget/general/user/user_avatar.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class EditProfilePictureButtons extends StatelessWidget {
  final bool showInitialsOptions;
  final String userName;
  final Color? selectedColor;
  final VoidCallback onImageTapped;
  final VoidCallback onCameraTapped;
  final VoidCallback onInitialsTapped;

  const EditProfilePictureButtons({
    required this.onCameraTapped,
    required this.onImageTapped,
    required this.onInitialsTapped,
    required this.userName,
    required this.selectedColor,
    required this.showInitialsOptions,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          UserAvatar(
            name: userName,
            size: ThemeDimens.hugeIcon,
            color: selectedColor,
          ),
          const SizedBox(width: 8),
          EditProfilePictureButton(
            icon: ThemeAssets.imageIcon,
            onTapped: onImageTapped,
          ),
          const SizedBox(width: 8),
          EditProfilePictureButton(
            icon: ThemeAssets.cameraIcon,
            onTapped: onCameraTapped,
          ),
          const SizedBox(width: 8),
          CustomPaint(
            painter: DropPainter(
              theme.colorsTheme.bgCard,
              showInitialsOptions,
            ),
            child: UserAvatar(
              name: userName,
              onTapped: onInitialsTapped,
              color: Colors.transparent,
              size: ThemeDimens.hugeIcon,
            ),
          ),
        ],
      ),
    );
  }
}
