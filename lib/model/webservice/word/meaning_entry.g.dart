// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeaningEntry _$MeaningEntryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['typeString', 'meanings'],
  );
  return MeaningEntry(
    typeString: json['typeString'] as String,
    meanings:
        (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
    type: $enumDecodeNullable(_$WordTypeEnumMap, json['type']),
    misc: json['misc'] as String?,
  );
}

Map<String, dynamic> _$MeaningEntryToJson(MeaningEntry instance) {
  final val = <String, dynamic>{
    'typeString': instance.typeString,
    'meanings': instance.meanings,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$WordTypeEnumMap[instance.type]);
  writeNotNull('misc', instance.misc);
  return val;
}

const _$WordTypeEnumMap = {
  WordType.noun: 'noun',
  WordType.adjective: 'adjective',
};
