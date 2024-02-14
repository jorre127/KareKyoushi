import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class AnalyticsPermissionScreen extends StatelessWidget {
  const AnalyticsPermissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<AnalyticsPermissionViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => AnnotatedRegion<SystemUiOverlayStyle>(
        value: theme.isDarkTheme ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.permissionScreenBackground,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 32,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        Expanded(
                          flex: 5,
                          child: SvgPicture.asset(
                            ThemeAssets.analyticsImage(context),
                            alignment: Alignment.center,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        const Spacer(),
                        const SizedBox(height: 32),
                        Text(
                          localization.permissionAnalyticsTitle,
                          style: theme.textThemes.coreTextTheme.titleNormal,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          localization.permissionAnalyticsDescription,
                          textAlign: TextAlign.center,
                          style: theme.textThemes.coreTextTheme.bodyNormal,
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                KKButton(
                  text: localization.permissionButtonAccept,
                  onClick: viewModel.onAcceptClicked,
                ),
                const SizedBox(height: 8),
                KKButton.text(
                  text: localization.permissionButtonMoreInfo,
                  onClick: viewModel.onMoreInfoClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
