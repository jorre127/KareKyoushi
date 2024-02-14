import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';
import 'package:kare_kyoushi/util/extension/context_extension.dart';
import 'package:kare_kyoushi/util/keys.dart';
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_input_field.dart';
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
  final _scrollController = ScrollController();
  var _isKeyboardExpanded = false;

  void _checkIfKeyboardExpandedChanged() {
    if (!_isKeyboardExpanded && context.isShowingKeyboard) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => scrollToEnd(),
      );
    }
    _isKeyboardExpanded = context.isShowingKeyboard;
  }

  Future<void> scrollToEnd() async {
    await Future.delayed(const Duration(milliseconds: 500));
    await _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: ThemeDurations.shortAnimationDuration,
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    _checkIfKeyboardExpandedChanged();
    return ProviderWidget<LoginViewModel>(
      create: () => getIt()..init(),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => BaseScreen.child(
        child: Stack(
          children: [
            ListView(
              controller: _scrollController,
              children: [
                Image.asset(
                  ThemeAssets.splashImage,
                  width: 220,
                  height: 270,
                ),
                const SizedBox(height: 48),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    localization.loginScreenUsernameLabel,
                    style: theme.textThemes.subtleTextTheme.copySubtle,
                  ),
                ),
                const SizedBox(height: 4),
                KKInputField(
                  key: Keys.emailInput,
                  enabled: !viewModel.isLoading,
                  onChanged: viewModel.onEmailUpdated,
                ),
                Container(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    localization.loginScreenPasswordLabel,
                    style: theme.textThemes.subtleTextTheme.copySubtle,
                  ),
                ),
                const SizedBox(height: 4),
                KKInputField(
                  key: Keys.passwordInput,
                  enabled: !viewModel.isLoading,
                  onChanged: viewModel.onPasswordUpdated,
                ),
                if (context.isShowingKeyboard) ...[
                  IgnorePointer(
                    child: Opacity(
                      opacity: 0,
                      child: KKButton(
                        text: '',
                        onClick: viewModel.onLoginClicked,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ]
              ],
            ),
            Align(
              key: Keys.loginButton,
              alignment: Alignment.bottomCenter,
              child: KKButton(
                isEnabled: viewModel.isLoginEnabled,
                text: localization.loginButton,
                onClick: viewModel.onLoginClicked,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
