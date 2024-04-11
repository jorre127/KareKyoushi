import 'dart:io';

import 'package:kare_kyoushi/model/webservice/user/user_data.dart';

abstract class UserService {
  Future<void> updateProfile({
    required String id,
    bool includePhotoIfNull = true,
    String? userName,
    String? photo,
    int? userColor,
  });

  Future<UserData?> getProfile({required String id});

  Future<String> saveProfilePicture({
    required String id,
    required File picture,
  });
}
