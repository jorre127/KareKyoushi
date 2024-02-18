import 'package:drift/drift.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/type_converter/alphabet_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/difficulty_grade_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/knowledge_level_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/list_converter.dart';

@DataClassName('DbCharacter')
class DbCharacterTable extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {value};

  TextColumn get value => text()();

  TextColumn get kunyomi => text().map(const ListConverter<String>())();

  TextColumn get onyomi => text().map(const ListConverter<String>())();

  TextColumn get meanings => text().map(const ListConverter<String>())();

  IntColumn get difficultyGrade => integer().map(const DifficultyGradeTypeConverter())();

  TextColumn get alphbabet => text().map(const AlphabetTypeConverter())();

  IntColumn? get grade => integer().nullable()();

  IntColumn? get frequency => integer().nullable()();

  IntColumn? get knowledgeLevel => integer().nullable().map(const KnowledgeLevelTypeConverter())();
}

extension CharacterExtension on Character {
  DbCharacter get dbModel => DbCharacter(
        value: value,
        difficultyGrade: difficultyGrade,
        kunyomi: kunyomi,
        onyomi: onyomi,
        meanings: meanings,
        grade: grade,
        frequency: frequency,
        knowledgeLevel: knowledgeLevel,
        alphbabet: alphbabet,
      );
}

extension DbCharacterExtension on DbCharacter {
  Character get model => Character(
        value: value,
        difficultyGrade: difficultyGrade,
        kunyomi: kunyomi,
        onyomi: onyomi,
        meanings: meanings,
        grade: grade,
        frequency: frequency,
        knowledgeLevel: knowledgeLevel,
        alphbabet: alphbabet,
      );
}
