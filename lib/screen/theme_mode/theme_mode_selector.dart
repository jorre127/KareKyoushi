import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart';
import 'package:kare_kyoushi/widget/debug/selector_item.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class ThemeModeSelectorScreen extends StatefulWidget {
  const ThemeModeSelectorScreen({super.key});

  @override
  ThemeModeSelectorScreenState createState() => ThemeModeSelectorScreenState();
}

@visibleForTesting
class ThemeModeSelectorScreenState extends State<ThemeModeSelectorScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugThemeSelectorViewModel>(
      create: getIt.call,
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: KKBackButton.light(onClick: viewModel.onBackClicked),
          title: const Text('Select a theme mode'),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView(
          children: [
            SelectorItem(
              title: localization.generalLabelSystemDefault,
              onClick: () => viewModel.updateThemeMode(ThemeMode.system),
              selected: viewModel.themeMode == ThemeMode.system,
            ),
            SelectorItem(
              title: localization.themeModeLabelLight,
              onClick: () => viewModel.updateThemeMode(ThemeMode.light),
              selected: viewModel.themeMode == ThemeMode.light,
            ),
            SelectorItem(
              title: localization.themeModeLabelDark,
              onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
              selected: viewModel.themeMode == ThemeMode.dark,
            ),
          ],
        ),
      ),
    );
  }
}
