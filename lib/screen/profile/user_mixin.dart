import 'dart:ui';

import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/webservice/user/user_data.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';

mixin UserMixin on ChangeNotifierEx {
  final UserRepository _userRepository = getIt();

  UserData? _user;

  void initUser() {
    registerDisposeStream(_userRepository.profileStream.listen(_onUserChanged));
  }

  void _onUserChanged(UserData user) {
    _user = user;
    if (disposed) return;
    notifyListeners();
  }

  String get userName => _user?.userName ?? '';

  String? get userPhoto => _user?.photo;

  Color? get userColor => _user?.userColor == null ? null : Color(_user!.userColor!);
}
