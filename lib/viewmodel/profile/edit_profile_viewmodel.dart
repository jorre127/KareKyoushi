import 'dart:io';
import 'dart:ui';

import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';
import 'package:kare_kyoushi/util/extension/future_extension.dart';
import 'package:kare_kyoushi/util/image/image_picker_util.dart';

@injectable
class EditProfileViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final UserRepository _userRepository;
  final ImagePickerUtil _imagePickerUtil;

  late var _userName = _userRepository.userData.userName;

  bool _showInitialsOptions = false;
  bool _isSaving = false;
  Color? _selectedColor;
  File? _selectedImage;

  String get userName => _userName;

  bool get showInitialsOptions => _showInitialsOptions;

  bool get isSaving => _isSaving;

  Color? get selectedColor => _selectedColor;

  File? get selectedImage => _selectedImage;

  EditProfileViewModel(
    this._userRepository,
    this._imagePickerUtil,
    this._navigator,
  );

  Future<void> init() async {}

  void onUserNameChanged(String userName) {
    _userName = userName;
    notifyListeners();
  }

  Future<void> onCameraTapped() async {
    final image = await _imagePickerUtil.pickImageFromCamera();
    _selectedImage = image;
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onImageTapped() async {
    final image = await _imagePickerUtil.pickImageFromCameraRoll();
    _selectedImage = image;
    if (disposed) return;
    notifyListeners();
  }

  void onInitialsTapped() {
    _showInitialsOptions = !_showInitialsOptions;
    notifyListeners();
  }

  void onColorTapped(Color color) {
    _selectedColor = color;
    _selectedImage = null;
    notifyListeners();
  }

  Future<void> onConfirmTapped() async {
    _isSaving = true;
    notifyListeners();
    await _userRepository
        .updateProfile(
          userName: userName,
          photo: _selectedImage,
          photoBackgroundColor: _selectedColor.toString(),
        )
        .withErrorHandling(
          errorMessage: 'Failed to update profile',
          onSuccess: (_) => _navigator.goBack(),
        );
    _isSaving = false;
    if (disposed) return;
    notifyListeners();
  }
}
