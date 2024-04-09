
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/util/permission/permission_util.dart';

mixin PermissionMixin {
  late final PermissionUtil _permissionUtil = getIt();

  var _isDenied = true;

  bool get hasPermission => !_isDenied;

  Future<bool> hasDeclinedPermission(PermissionUtil permissionUtil);

  Future<bool> askPermission(PermissionUtil permissionUtil);

  void onPermissionGiven();

  Future<bool> checkPermission() async {
    _isDenied = await hasDeclinedPermission(_permissionUtil);
    return !_isDenied;
  }

  Future<void> askPermissionOrOpenSettings() async {
    var permissionGiven = await askPermission(_permissionUtil);
    if (!permissionGiven) {
      await _goToSettings();
    }
    permissionGiven = await checkPermission();
    if (permissionGiven) onPermissionGiven();
  }

  Future<void> onResume() async {
    final permissionGiven = await checkPermission();
    if (permissionGiven) onPermissionGiven();
  }

  Future<void> _goToSettings() => _permissionUtil.openSettings();
}
