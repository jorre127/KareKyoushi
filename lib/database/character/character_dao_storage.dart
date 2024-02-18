import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/database/character/character_table.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';

part 'character_dao_storage.g.dart';

@lazySingleton
abstract class CharacterDaoStorage {
  @factoryMethod
  factory CharacterDaoStorage(KKDatabase database) = _CharacterDaoStorage;

  Future<bool> hasData();

  Future<void> initCharacters(List<Character> characters);

  Stream<List<Character>> getCharacterForLevelStream(int level);

  Future<Character> getCharacter(String character);

  Stream<List<Character>> getCharacterStream();

  Future<void> updateKnowledgeLevelForCharacter({
    required KnowledgeLevel? level,
    required String character,
  });
}

@DriftAccessor(
  tables: [
    DbCharacterTable,
  ],
)
class _CharacterDaoStorage extends DatabaseAccessor<KKDatabase> with _$_CharacterDaoStorageMixin implements CharacterDaoStorage {
  _CharacterDaoStorage(super.db);

  @override
  Future<bool> hasData() async => await (db.dbCharacterTable.count().getSingle()) > 0;

  @override
  Future<void> initCharacters(List<Character> characters) => batch((batch) => batch.insertAllOnConflictUpdate(db.dbCharacterTable, characters.map((character) => character.dbModel)));

  @override
  Stream<List<Character>> getCharacterForLevelStream(int level) => (select(db.dbCharacterTable)
        ..where(
          (tbl) => tbl.difficultyGrade.equals(level),
        ))
      .watch()
      .map((characterList) => characterList.map((character) => character.model).toList());

  @override
  Future<void> updateKnowledgeLevelForCharacter({
    required KnowledgeLevel? level,
    required String character,
  }) =>
      (update(db.dbCharacterTable)..where((tbl) => tbl.value.equals(character))).write(DbCharacterTableCompanion(knowledgeLevel: Value(level)));

  @override
  Future<Character> getCharacter(String character) async => (await (select(db.dbCharacterTable)..where((tbl) => tbl.value.equals(character))).getSingle()).model;

  @override
  Stream<List<Character>> getCharacterStream() => select(db.dbCharacterTable).watch().map((event) => event.map((e) => e.model).toList());
}
