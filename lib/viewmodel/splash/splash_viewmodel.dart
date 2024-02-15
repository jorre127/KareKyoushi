import 'dart:async';

import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart';
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart';
import 'package:kare_kyoushi/repository/startup/startup_helper.dart';

@injectable
class SplashViewModel with ChangeNotifierEx {
  final LocalStorage _localStorage;
  final OnboardingNavigator _onboardingNavigator;
  final StartupHelper _startupHelper;

  SplashViewModel(
    this._localStorage,
    this._onboardingNavigator,
    this._startupHelper,
  );

  Future<void> init() async {
    await _localStorage.checkForNewInstallation();
    await _startupHelper.startup();
    await _onboardingNavigator.goToNextScreen();
  }
}
