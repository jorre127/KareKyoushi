// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  @JsonKey(name: 'nickname', required: true)
  final String nickname;
  @JsonKey(name: 'photo', includeIfNull: false)
  final String? photo;

  const UserData({
    required this.nickname,
    this.photo,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}
