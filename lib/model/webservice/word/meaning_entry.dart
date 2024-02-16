// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'meaning_entry.g.dart';

@JsonSerializable(explicitToJson: true)
class MeaningEntry {
  @JsonKey(name: 'type', required: true)
  final String type;
  @JsonKey(name: 'meanings', required: true)
  final List<String> meanings;
  @JsonKey(name: 'misc', includeIfNull: false)
  final String? misc;

  const MeaningEntry({
    required this.type,
    required this.meanings,
    this.misc,
  });

  factory MeaningEntry.fromJson(Map<String, dynamic> json) => _$MeaningEntryFromJson(json);

  Map<String, dynamic> toJson() => _$MeaningEntryToJson(this);

}
