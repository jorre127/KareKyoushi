import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/database/kanji/kanji_table.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';

part 'kanji_dao_storage.g.dart';

@lazySingleton
abstract class KanjiDaoStorage {
  @factoryMethod
  factory KanjiDaoStorage(KKDatabase database) = _KanjiDaoStorage;

  Future<bool> hasData();

  Future<void> initKanji(List<Kanji> kanji);

  Stream<List<Kanji>> getKanjiForLevelStream(int level);

  Future<Kanji> getKanji(String kanji);

  Stream<List<Kanji>> getKanjiStream();

  Future<void> updateKnowledgeLevelForKanji({
    required KnowledgeLevel? level,
    required String kanji,
  });
}

@DriftAccessor(
  tables: [
    DbKanjiTable,
  ],
)
class _KanjiDaoStorage extends DatabaseAccessor<KKDatabase> with _$_KanjiDaoStorageMixin implements KanjiDaoStorage {
  _KanjiDaoStorage(super.db);

  @override
  Future<bool> hasData() async => await (db.dbKanjiTable.count().getSingle()) > 0;

  @override
  Future<void> initKanji(List<Kanji> kanji) => batch((batch) => batch.insertAllOnConflictUpdate(db.dbKanjiTable, kanji.map((kanji) => kanji.dbModel)));

  @override
  Stream<List<Kanji>> getKanjiForLevelStream(int level) => (select(db.dbKanjiTable)
        ..where(
          (tbl) => tbl.jlpt.equals(level),
        ))
      .watch()
      .map((kanjiList) => kanjiList.map((kanji) => kanji.model).toList());

  @override
  Future<void> updateKnowledgeLevelForKanji({
    required KnowledgeLevel? level,
    required String kanji,
  }) =>
      (update(db.dbKanjiTable)..where((tbl) => tbl.kanjiValue.equals(kanji))).write(DbKanjiTableCompanion(knowledgeLevel: Value(level)));

  @override
  Future<Kanji> getKanji(String kanji) async => (await (select(db.dbKanjiTable)..where((tbl) => tbl.kanjiValue.equals(kanji))).getSingle()).model;

  @override
  Stream<List<Kanji>> getKanjiStream() => select(db.dbKanjiTable).watch().map((event) => event.map((e) => e.model).toList());
}
