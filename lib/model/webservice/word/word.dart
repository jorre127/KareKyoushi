// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';

part 'word.g.dart';

@JsonSerializable(explicitToJson: true)
class Word {
  @JsonKey(name: 'id', required: true)
  final String id;
  @JsonKey(name: 'value', required: true)
  final String value;
  @JsonKey(name: 'reading', required: true)
  final String reading;
  @JsonKey(name: 'isCommon', required: true)
  final bool isCommon;
  @JsonKey(name: 'meaningEntries', required: true)
  final List<MeaningEntry> meaningEntries;
  @JsonKey(name: 'priority', includeIfNull: false)
  final int? priority;
  @JsonKey(name: 'jlpt', includeIfNull: false)
  final Jlpt? jlpt;

  const Word({
    required this.id,
    required this.value,
    required this.reading,
    required this.isCommon,
    required this.meaningEntries,
    this.priority,
    this.jlpt,
  });

  factory Word.fromJson(Map<String, dynamic> json) => _$WordFromJson(json);

  Map<String, dynamic> toJson() => _$WordToJson(this);

}
