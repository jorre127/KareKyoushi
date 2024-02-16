// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeaningEntry _$MeaningEntryFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['type', 'meanings'],
  );
  return MeaningEntry(
    type: json['type'] as String,
    meanings:
        (json['meanings'] as List<dynamic>).map((e) => e as String).toList(),
    misc: json['misc'] as String?,
  );
}

Map<String, dynamic> _$MeaningEntryToJson(MeaningEntry instance) {
  final val = <String, dynamic>{
    'type': instance.type,
    'meanings': instance.meanings,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('misc', instance.misc);
  return val;
}
