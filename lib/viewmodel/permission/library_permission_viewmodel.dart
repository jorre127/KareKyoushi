import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/util/permission/permission_util.dart';
import 'package:kare_kyoushi/viewmodel/permission/permission_mixin.dart';

@injectable
class LibraryPermissionViewModel with ChangeNotifierEx, PermissionMixin {
  final MainNavigator _navigator;

  LibraryPermissionViewModel(this._navigator);

  @override
  Future<bool> askPermission(PermissionUtil permissionUtil) => permissionUtil.askLibraryPermission();

  @override
  Future<bool> hasDeclinedPermission(PermissionUtil permissionUtil) => permissionUtil.hasDeclinedLibraryPermission();

  @override
  void onPermissionGiven() => _navigator.goBackWithResult(result: true);

  void onAllowLibraryPermissionTapped() => askPermissionOrOpenSettings();
}
