import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/general/svg_icon.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class EditProfilePictureButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTapped;

  const EditProfilePictureButton({
    required this.icon,
    required this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedBack(
        onTapped: onTapped,
        child: Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: theme.colorsTheme.bgCard,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgIcon(
              svgAsset: icon,
              color: theme.colorsTheme.icon,
            ),
          ),
        ),
      ),
    );
  }
}
