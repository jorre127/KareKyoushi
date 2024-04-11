import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/screen/profile/user_mixin.dart';

@injectable
class ProfileViewModel with ChangeNotifierEx, UserMixin {
  final MainNavigator _navigator;

  ProfileViewModel(
    this._navigator,
  );

  Future<void> init() async {
    initUser();
  }

  void onEditTapped() => _navigator.goToEditProfileScreen();

  void onBackTapped() => _navigator.goBack();
}
