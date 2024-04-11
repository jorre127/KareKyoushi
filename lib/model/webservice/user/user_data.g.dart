// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'userName'],
  );
  return UserData(
    id: json['id'] as String,
    userName: json['userName'] as String,
    photo: json['photo'] as String?,
    userColor: json['userColor'] as int?,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'userName': instance.userName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photo', instance.photo);
  writeNotNull('userColor', instance.userColor);
  return val;
}
