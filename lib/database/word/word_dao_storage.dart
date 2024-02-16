import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/database/word/word_table.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';

part 'word_dao_storage.g.dart';

@lazySingleton
abstract class WordDaoStorage {
  @factoryMethod
  factory WordDaoStorage(KKDatabase database) = _WordDaoStorage;

  Future<bool> hasData();

  Future<void> initWords(List<Word> words);

  Future<List<Word>> getWordsContaining(String kanji);
}

@DriftAccessor(
  tables: [
    DbWordTable,
  ],
)
class _WordDaoStorage extends DatabaseAccessor<KKDatabase> with _$_WordDaoStorageMixin implements WordDaoStorage {
  _WordDaoStorage(super.db);

  @override
  Future<bool> hasData() async => await (db.dbWordTable.count().getSingle()) > 0;

  @override
  Future<void> initWords(List<Word> words) => batch((batch) => batch.insertAllOnConflictUpdate(db.dbWordTable, words.map((word) => word.dbModel)));

  @override
  Future<List<Word>> getWordsContaining(String kanji) async {
    final dbWords = await (select(db.dbWordTable)..where((tbl) => tbl.value.contains(kanji))).get();
    return dbWords.map((dbWord) => dbWord.model).toList();
  }
}
