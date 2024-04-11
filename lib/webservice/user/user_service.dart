import 'package:kare_kyoushi/model/webservice/user/user_data.dart';

abstract class UserService {
  Future<void> updateProfile({
    required String id,
    String? userName,
    String? photo,
    int? userColor,
  });

  Future<UserData?> getProfile({required String id});

  void saveProfilePicture();
}
