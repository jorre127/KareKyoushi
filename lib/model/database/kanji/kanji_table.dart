import 'package:drift/drift.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/model/type_converter/jlpt_type_converter.dart';
import 'package:kare_kyoushi/model/type_converter/list_converter.dart';

@DataClassName('DbKanji')
class DbKanjiTable extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {kanjiValue};

  TextColumn get kanjiValue => text()();

  TextColumn get kunyomi => text().map(const ListConverter<String>())();

  TextColumn get onyomi => text().map(const ListConverter<String>())();

  TextColumn get meanings => text().map(const ListConverter<String>())();

  IntColumn? get jlpt => integer().nullable().map(const JlptTypeConverter())();

  IntColumn? get grade => integer().nullable()();

  IntColumn? get frequency => integer().nullable()();
}

extension KanjiExtension on Kanji {
  DbKanji get dbModel => DbKanji(
        kanjiValue: kanjiValue,
        jlpt: jlpt,
        kunyomi: kunyomi,
        onyomi: onyomi,
        meanings: meanings,
        grade: grade,
        frequency: frequency,
      );
}

extension DbKanjiExtension on DbKanji {
  Kanji get model => Kanji(
        kanjiValue: kanjiValue,
        jlpt: jlpt,
        kunyomi: kunyomi,
        onyomi: onyomi,
        meanings: meanings,
        grade: grade,
        frequency: frequency,
      );
}
