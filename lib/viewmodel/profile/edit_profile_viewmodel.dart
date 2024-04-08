import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';

@injectable
class EditProfileViewModel with ChangeNotifierEx {
  final UserRepository _userRepository;

  late var _userName = _userRepository.userData.userName;

  String get userName => _userName;

  EditProfileViewModel(
    this._userRepository,
  );

  Future<void> init() async {}

  void onUserNameChanged(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void onCameraTapped() {}

  void onImageTapped() {}
}
