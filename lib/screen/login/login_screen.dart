import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/util/keys.dart';
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart';
import 'package:kare_kyoushi/widget/general/status_bar.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_input_field.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_indicator.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

@visibleForTesting
class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LoginViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.animated(
        isDarkStyle: theme.isDarkTheme,
        child: Scaffold(
          backgroundColor: theme.colorsTheme.background,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(ThemeDimens.padding16),
              child: Column(
                children: [
                  Container(height: ThemeDimens.padding16),
                  Text(
                    'Login',
                    style: theme.coreTextTheme.titleNormal,
                    textAlign: TextAlign.center,
                  ),
                  Container(height: ThemeDimens.padding32),
                  Text(
                    'Just fill in some text. There is no validator for the login',
                    style: theme.coreTextTheme.labelButtonSmall,
                  ),
                  Container(height: ThemeDimens.padding32),
                  KKInputField(
                    key: Keys.emailInput,
                    enabled: !viewModel.isLoading,
                    onChanged: viewModel.onEmailUpdated,
                    hint: 'Email',
                  ),
                  Container(height: ThemeDimens.padding16),
                  KKInputField(
                    key: Keys.passwordInput,
                    enabled: !viewModel.isLoading,
                    onChanged: viewModel.onPasswordUpdated,
                    hint: 'Password',
                  ),
                  Container(height: ThemeDimens.padding16),
                  if (viewModel.isLoading) ...[
                    const KKProgressIndicator.light(),
                  ] else ...[
                    KKButton(
                      key: Keys.loginButton,
                      isEnabled: viewModel.isLoginEnabled,
                      text: 'Login',
                      onClick: viewModel.onLoginClicked,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
