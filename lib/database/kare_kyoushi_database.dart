import 'package:drift/drift.dart';

part 'kare_kyoushi_database.g.dart';

@DriftDatabase(tables: [
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
