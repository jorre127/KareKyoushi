import 'package:drift/drift.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/model/type_converter/jlpt_type_converter.dart';

@DataClassName('DbKanji')
class DbKanjiTable extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {kanjiValue};

  TextColumn get kanjiValue => text()();

  IntColumn? get jlpt => integer().nullable().map(const JlptTypeConverter())();
}

extension KanjiExtension on Kanji {
  DbKanji get dbModel => DbKanji(
        kanjiValue: kanjiValue,
        jlpt: jlpt,
      );
}

extension DbKanjiExtension on DbKanji {
  Kanji get model => Kanji(
        kanjiValue: kanjiValue,
        jlpt: jlpt,
      );
}
