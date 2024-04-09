import 'dart:io';

import 'package:image/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/util/permission/permission_util.dart';
import 'package:kare_kyoushi/util/platform/platform_util.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

typedef AsyncBoolCallback = Future<bool> Function();

typedef NullableAsyncBoolCallback = Future<bool?> Function();

@lazySingleton
class ImagePickerUtil {
  static const _folderName = 'images';

  final ImagePicker _imagePicker;
  final MainNavigator _navigator;
  final PermissionUtil _permissionUtil;

  static const _maxImageSize = 1920.0;

  ImagePickerUtil(
    this._navigator,
    this._imagePicker,
    this._permissionUtil,
  );

  Future<File?> pickImageFromCameraRoll() => _pickImageFromSource(
        source: ImageSource.gallery,
        checkPermission: PlatformUtil.isIOS ? _checkLibraryPermission : null,
      );

  Future<File?> pickImageFromCamera() => _pickImageFromSource(
        source: ImageSource.camera,
        checkPermission: _checkCameraPermission,
      );

  Future<bool> _checkCameraPermission() => _checkPermission(
        checkHasPermission: _permissionUtil.hasCameraPermission,
        goToPermissionScreen: _navigator.goToCameraPermissionScreen,
      );

  Future<bool> _checkLibraryPermission() => _checkPermission(
        checkHasPermission: _permissionUtil.hasLibraryPermission,
        goToPermissionScreen: _navigator.goToLibraryPermissionScreen,
      );

  Future<bool> _checkPermission({
    required AsyncBoolCallback checkHasPermission,
    required NullableAsyncBoolCallback goToPermissionScreen,
  }) async {
    var hasPermission = await checkHasPermission();
    if (hasPermission) return hasPermission;
    final result = await goToPermissionScreen();
    if (result == null) return false;
    hasPermission = result;
    return hasPermission;
  }

  Future<File?> _pickImageFromSource({
    required ImageSource source,
    required AsyncBoolCallback? checkPermission,
  }) async {
    if (await checkPermission?.call() == false) return null;
    final result = await _imagePicker.pickImage(
      source: source,
      maxHeight: _maxImageSize,
      maxWidth: _maxImageSize,
    );
    if (result == null) return null;
    final documentDir = await getApplicationDocumentsDirectory();
    final temporaryFile = File(join(documentDir.path, _folderName, result.name));
    await temporaryFile.create(recursive: true);
    await result.saveTo(temporaryFile.path);
    return _convertToJpeg(temporaryFile);
  }

  Future<File> _convertToJpeg(File imageFile) async {
    final decoder = findDecoderForData(imageFile.readAsBytesSync());
    if (decoder is JpegDecoder) return imageFile;
    final image = decoder?.decode(imageFile.readAsBytesSync());
    if (image == null) return imageFile;
    final jpeg = encodeJpg(image);
    return imageFile..writeAsBytesSync(jpeg);
  }

  Future<void> clearCache() async {
    final documentDir = await getApplicationDocumentsDirectory();
    final dir = Directory(join(documentDir.path, _folderName));
    if (dir.existsSync()) {
      await dir.delete(recursive: true);
    }
  }
}
