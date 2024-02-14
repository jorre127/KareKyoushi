import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class LicenseScreen extends StatefulWidget {
  const LicenseScreen({super.key});

  @override
  LicenseScreenState createState() => LicenseScreenState();
}

@visibleForTesting
class LicenseScreenState extends State<LicenseScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LicenseViewModel>(
      create: getIt,
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => Scaffold(
        backgroundColor: theme.colorsTheme.background,
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: KKBackButton.light(onClick: viewModel.onBackClicked),
          title: Text(localization.debugLicensesTitle),
          backgroundColor: theme.colorsTheme.primary,
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(ThemeDimens.padding16),
          itemCount: viewModel.licenses.length,
          itemBuilder: (context, index) {
            final item = viewModel.licenses[index];
            return Card(
              color: theme.colorsTheme.background,
              child: Padding(
                padding: const EdgeInsets.all(ThemeDimens.padding16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: theme.coreTextTheme.titleNormal,
                    ),
                    Container(height: ThemeDimens.padding8),
                    Text(
                      item.license,
                      style: theme.coreTextTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
