import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';

class KnowledgeLevelTypeConverter extends TypeConverter<KnowledgeLevel?, int?> {
  const KnowledgeLevelTypeConverter();

  @override
  KnowledgeLevel? fromSql(int? fromDb) {
    final intValue = KnowledgeLevel.values.where((jlpt) => jlpt.id == fromDb);
    if (intValue.isEmpty) return null;
    return intValue.first;
  }

  @override
  int? toSql(KnowledgeLevel? value) => value?.id;
}
