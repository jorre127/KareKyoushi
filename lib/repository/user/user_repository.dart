import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/webservice/user/user_data.dart';

@lazySingleton
abstract class UserRepository {
  @factoryMethod
  factory UserRepository() = _UserRepository;

  Future<void> refreshUser() async {}

  UserData get userData;
}

class _UserRepository implements UserRepository {
  UserData? _userData;

  _UserRepository();

  @override
  UserData get userData => _userData ?? const UserData(nickname: 'Jordy');

  @override
  Future<void> refreshUser() async {
    // TODO: implement refreshUser
  }
}
