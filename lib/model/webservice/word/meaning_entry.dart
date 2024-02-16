// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:kare_kyoushi/model/enum/wordtype.dart';

part 'meaning_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class MeaningEntry {
  @JsonKey(name: 'typeString', required: true)
  final String typeString;
  @JsonKey(name: 'meanings', required: true)
  final List<String> meanings;
  @JsonKey(name: 'type', includeIfNull: false)
  final WordType? type;
  @JsonKey(name: 'misc', includeIfNull: false)
  final String? misc;

  const MeaningEntry({
    required this.typeString,
    required this.meanings,
    this.type,
    this.misc,
  });

  factory MeaningEntry.fromJson(Map<String, dynamic> json) => _$MeaningEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningEntryToJson(this);

}
