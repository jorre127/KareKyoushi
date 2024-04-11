// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  @JsonKey(name: 'id', required: true)
  final String id;
  @JsonKey(name: 'userName', required: true)
  final String userName;
  @JsonKey(name: 'photo', includeIfNull: false)
  final String? photo;
  @JsonKey(name: 'photoBackground', includeIfNull: false)
  final String? photoBackground;

  const UserData({
    required this.id,
    required this.userName,
    this.photo,
    this.photoBackground,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}
