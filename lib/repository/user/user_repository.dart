import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/webservice/user/user_data.dart';
import 'package:kare_kyoushi/webservice/user/user_service.dart';

@lazySingleton
abstract class UserRepository {
  @factoryMethod
  factory UserRepository(UserService userService, FirebaseAuth auth) = _UserRepository;

  Future<void> refreshUser() async {}

  Future<void> updateProfile({
    String? userName,
    File? photo,
    String? photoBackgroundColor,
  });

  UserData get userData;
}

class _UserRepository implements UserRepository {
  final UserService _userService;
  final FirebaseAuth _auth;

  UserData? _userData;

  _UserRepository(
    this._userService,
    this._auth,
  );

  @override
  UserData get userData =>
      _userData ??
      const UserData(
        id: '',
        userName: 'Jordy',
      );

  @override
  Future<void> refreshUser() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;
    _userData = await _userService.getProfile(id: userId);
  }

  @override
  Future<void> updateProfile({
    String? userName,
    File? photo,
    String? photoBackgroundColor,
  }) async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;
    return _userService.updateProfile(
      id: userId,
      userName: userName,
      photoBackgroundColor: photoBackgroundColor,
    );
  }
}
