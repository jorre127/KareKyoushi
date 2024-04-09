import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';
import 'package:kare_kyoushi/util/image/image_picker_util.dart';

@injectable
class EditProfileViewModel with ChangeNotifierEx {
  final UserRepository _userRepository;
  final ImagePickerUtil _imagePickerUtil;

  late var _userName = _userRepository.userData.userName;

  String get userName => _userName;

  EditProfileViewModel(
    this._userRepository,
    this._imagePickerUtil,
  );

  Future<void> init() async {}

  void onUserNameChanged(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<void> onCameraTapped() async {
    final image = await _imagePickerUtil.pickImageFromCamera();
    print(image);
  }

  Future<void> onImageTapped() async {
    final image = await _imagePickerUtil.pickImageFromCameraRoll();
    print(image);
  }
}
