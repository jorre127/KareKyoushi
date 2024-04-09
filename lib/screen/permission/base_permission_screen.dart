import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/general/svg_icon.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class BasePermissionScreen extends StatelessWidget {
  final String title;
  final String message;
  final String image;
  final String buttonText;
  final VoidCallback onButtonTapped;
  final VoidCallback? onResume;

  const BasePermissionScreen({
    required this.title,
    required this.message,
    required this.image,
    required this.buttonText,
    required this.onButtonTapped,
    this.onResume,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => LifecycleWidget(
        onResume: onResume,
        child: BaseScreen(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgIcon(svgAsset: image),
                    const SizedBox(height: 40),
                    Text(
                      title,
                      style: theme.textThemes.coreTextTheme.titleHuge,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: theme.textThemes.subtleTextTheme.bodyNormal,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            KKButton(
              text: buttonText,
              onClick: onButtonTapped,
            ),
          ],
        ),
      ),
    );
  }
}
