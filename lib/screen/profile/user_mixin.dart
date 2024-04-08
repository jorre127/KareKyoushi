import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';

mixin UserMixin {
  final UserRepository _userRepository = getIt();

  String get userName => _userRepository.userData.userName;

  String? get userPhoto => _userRepository.userData.photo;
}
