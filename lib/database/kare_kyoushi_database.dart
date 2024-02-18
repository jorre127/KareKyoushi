import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/database/character/character_table.dart';
import 'package:kare_kyoushi/model/database/word/word_table.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/type_converter/alphabet_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/knowledge_level_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/list_converter.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';

part 'kare_kyoushi_database.g.dart';

@DriftDatabase(tables: [
  DbCharacterTable,
  DbWordTable,
])
class KKDatabase extends _$KKDatabase {
  KKDatabase(super.db);
  @override
  int get schemaVersion => 1;
  Future<void> deleteAllData() {
    return transaction(() async {
      for (final table in allTables) {
        await delete<Table, dynamic>(table).go();
      }
    });
  }
}
