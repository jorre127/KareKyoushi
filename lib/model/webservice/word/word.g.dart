// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Word _$WordFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'id',
      'value',
      'reading',
      'isCommon',
      'meaningEntries'
    ],
  );
  return Word(
    id: json['id'] as String,
    value: json['value'] as String,
    reading: json['reading'] as String,
    isCommon: json['isCommon'] as bool,
    meaningEntries: (json['meaningEntries'] as List<dynamic>)
        .map((e) => MeaningEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    priority: json['priority'] as int?,
    jlpt: $enumDecodeNullable(_$JlptEnumMap, json['jlpt']),
  );
}

Map<String, dynamic> _$WordToJson(Word instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'value': instance.value,
    'reading': instance.reading,
    'isCommon': instance.isCommon,
    'meaningEntries': instance.meaningEntries.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('priority', instance.priority);
  writeNotNull('jlpt', _$JlptEnumMap[instance.jlpt]);
  return val;
}

const _$JlptEnumMap = {
  Jlpt.n5: 'n5',
  Jlpt.n4: 'n4',
  Jlpt.n3: 'n3',
  Jlpt.n2: 'n2',
  Jlpt.n1: 'n1',
};
