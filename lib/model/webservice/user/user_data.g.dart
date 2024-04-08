// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['userName'],
  );
  return UserData(
    userName: json['userName'] as String,
    photo: json['photo'] as String?,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) {
  final val = <String, dynamic>{
    'userName': instance.userName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo', instance.photo);
  return val;
}
