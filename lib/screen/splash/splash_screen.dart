import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart';
import 'package:kare_kyoushi/widget/general/status_bar.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.primary,
          body: const Center(
            child: KKProgressIndicator.light(),
          ),
        ),
      ),
    );
  }
}
