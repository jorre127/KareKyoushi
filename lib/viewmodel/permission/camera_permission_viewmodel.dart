import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/util/permission/permission_util.dart';
import 'package:kare_kyoushi/viewmodel/permission/permission_mixin.dart';

@injectable
class CameraPermissionViewModel with ChangeNotifierEx, PermissionMixin {
  final MainNavigator _navigator;

  CameraPermissionViewModel(this._navigator);

  @override
  Future<bool> askPermission(PermissionUtil permissionUtil) => permissionUtil.askCameraPermission();

  @override
  Future<bool> hasDeclinedPermission(PermissionUtil permissionUtil) => permissionUtil.hasDeclinedCameraPermission();

  @override
  void onPermissionGiven() => _navigator.goBackWithResult<bool>(result: true);

  void onAllowCameraPermissionTapped() => askPermissionOrOpenSettings();
}
