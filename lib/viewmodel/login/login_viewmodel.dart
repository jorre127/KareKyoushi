import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart';
import 'package:kare_kyoushi/repository/login/login_repository.dart';
import 'package:kare_kyoushi/repository/startup/startup_helper.dart';
import 'package:kare_kyoushi/util/extension/future_extension.dart';

@injectable
class LoginViewModel with ChangeNotifierEx {
  final LoginRepository _loginRepo;
  final OnboardingNavigator _onboardingNavigator;
  final StartupHelper _startupHelper;

  var _isLoading = false;
  var _password = '';
  var _email = '';

  LoginViewModel(
    this._loginRepo,
    this._onboardingNavigator,
    this._startupHelper,
  );

  bool get isLoginEnabled => _password.isNotEmpty && _email.isNotEmpty;

  bool get isLoading => _isLoading;

  Future<void> init() async {}

  void onEmailUpdated(String email) {
    _email = email;
    notifyListeners();
  }

  void onPasswordUpdated(String password) {
    _password = password;
    notifyListeners();
  }

  Future<void> onLoginClicked() async {
    _isLoading = true;
    notifyListeners();
    await _loginRepo
        .login(
          email: _email,
          password: _password,
        )
        .withErrorHandling(
          errorMessage: 'Failed to login',
          onSuccess: (_) => _onboardingNavigator.goToNextScreen(),
        );
    await _startupHelper.startup();
    _isLoading = false;
    if (disposed) return;
    notifyListeners();
  }
}
