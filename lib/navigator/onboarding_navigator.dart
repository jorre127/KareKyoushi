import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/login/login_repository.dart';
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart';

@lazySingleton
class OnboardingNavigator {
  final MainNavigator _navigator;
  final LocalStorage _localStorage;
  final LoginRepository _loginRepository;

  const OnboardingNavigator(
    this._navigator,
    this._localStorage,
    this._loginRepository,
  );

  Future<void> goToNextScreen() async {
    if (_localStorage.hasAnalyticsPermission == null) return _navigator.goToAnalyticsPermissionScreen();
    if (_loginRepository.isNotLoggedIn) return _navigator.goToLoginScreen();
    return _navigator.goToMainScreen();
  }
}
