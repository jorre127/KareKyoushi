import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/widget/edit_profile/edit_profile_picture_button.dart';

class EditProfilePictureButtons extends StatelessWidget {
  final VoidCallback onImageTapped;
  final VoidCallback onCameraTapped;

  const EditProfilePictureButtons({
    required this.onCameraTapped,
    required this.onImageTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        EditProfilePictureButton(
          icon: ThemeAssets.imageIcon,
          onTapped: onImageTapped,
        ),
        const SizedBox(width: 8),
        EditProfilePictureButton(
          icon: ThemeAssets.cameraIcon,
          onTapped: onCameraTapped,
        ),
      ],
    );
  }
}
