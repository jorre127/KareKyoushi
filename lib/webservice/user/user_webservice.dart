import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/webservice/user/user_data.dart';
import 'package:kare_kyoushi/util/extension/firebase_extension.dart';
import 'package:kare_kyoushi/webservice/user/user_service.dart';

@LazySingleton(as: UserService)
class UserWebService implements UserService {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  UserWebService(
    this._firestore,
    this._storage,
  );

  @override
  Future<void> updateProfile({
    required String id,
    String? userName,
    String? photo,
    int? userColor,
  }) =>
      _firestore.user(id).set({
        'id': id,
        if (userName != null) 'userName': userName,
        if (photo != null) 'photo': photo,
        if (userColor != null) 'userColor': userColor,
      });

  @override
  Future<UserData?> getProfile({required String id}) async {
    final user = await _firestore.user(id).get();
    final data = user.data();
    if (data == null) return null;
    return UserData.fromJson(data);
  }

  @override
  void saveProfilePicture() {}
}
