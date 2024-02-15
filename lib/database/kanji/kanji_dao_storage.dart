import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/database/kanji/kanji_table.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';

part 'kanji_dao_storage.g.dart';

@lazySingleton
abstract class KanjiDaoStorage {
  @factoryMethod
  factory KanjiDaoStorage(KKDatabase database) = _KanjiDaoStorage;

  Future<void> initKanji(List<Kanji> kanji);

  Future<List<Kanji>> getKanjiForLevel(int level);
}

@DriftAccessor(
  tables: [
    DbKanjiTable,
  ],
)
class _KanjiDaoStorage extends DatabaseAccessor<KKDatabase> with _$_KanjiDaoStorageMixin implements KanjiDaoStorage {
  _KanjiDaoStorage(super.db);

  @override
  Future<void> initKanji(List<Kanji> kanji) async {
    final kanjiCount = await db.dbKanjiTable.count().getSingle();
    if (kanjiCount == 0) {
      await batch((batch) => batch.insertAllOnConflictUpdate(db.dbKanjiTable, kanji.map((kanji) => kanji.dbModel)));
    }
  }

  @override
  Future<List<Kanji>> getKanjiForLevel(int level) async {
    final kanji = await (select(db.dbKanjiTable)
          ..where((tbl) {
            return tbl.jlpt.equals(level);
          }))
        .get();
    return kanji.map((item) => item.model).toList();
  }
}
