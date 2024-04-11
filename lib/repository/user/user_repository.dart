import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
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
    int? userColor,
  });

  Stream<UserData> get profileStream;

  UserData get profile;
}

class _UserRepository implements UserRepository {
  final UserService _userService;
  final FirebaseAuth _auth;

  UserData? _userData;

  final _userStreamController = StreamControllerWithInitialValue<UserData>.broadcast();

  _UserRepository(
    this._userService,
    this._auth,
  );

  @override
  UserData get profile {
    if (_userData == null) {
      throw Exception('Failed userData is null, make sure the refreshUser() method is executed before using this getter');
    }
    return _userData!;
  }

  @override
  Stream<UserData> get profileStream => _userStreamController.stream;

  @override
  Future<void> refreshUser() async {
    final userId = _auth.currentUser?.uid;
    if (userId == null) return;
    _userData = await _userService.getProfile(id: userId);
    _userStreamController.add(_userData!);
  }

  @override
  Future<void> updateProfile({
    String? userName,
    File? photo,
    int? userColor,
  }) async {
    final userId = _auth.currentUser?.uid;
    String? photoUrl;
    if (userId == null) return;
    if (photo != null) {
      photoUrl = await _userService.saveProfilePicture(
        id: userId,
        picture: photo,
      );
    }
    await _userService.updateProfile(
      id: userId,
      userName: userName,
      userColor: userColor,
      photo: photoUrl,
      includePhotoIfNull: userColor != null,
      
    );
    await refreshUser();
  }
}
