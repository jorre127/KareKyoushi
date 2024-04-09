import 'package:injectable/injectable.dart';
import 'package:permission_handler/permission_handler.dart';

@lazySingleton
class PermissionUtil {
  // Ask permission
  Future<bool> askCameraPermission() async => _askPermission(Permission.camera);

  Future<bool> askLibraryPermission() async => _askPermission(Permission.photos);

  // Has permission
  Future<bool> hasCameraPermission() async => !_hasDeclinedPermission(await Permission.camera.status);

  Future<bool> hasLibraryPermission() async => !_hasDeclinedPermission(await Permission.photos.status);

  // Has no permission
  Future<bool> hasDeclinedCameraPermission() async => _hasDeclinedPermission(await Permission.camera.status);

  Future<bool> hasDeclinedLibraryPermission() async => _hasDeclinedPermission(await Permission.photos.status);

  // Helper functions
  bool _hasDeclinedPermission(PermissionStatus status) => status.isDenied || status.isPermanentlyDenied;

  Future<bool> _askPermission(Permission permission) async => !(await permission.request()).isPermanentlyDenied;

  Future<void> openSettings() async => openAppSettings();
}
