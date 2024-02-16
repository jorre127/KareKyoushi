import 'package:drift/drift.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/model/type_converter/list_converter.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';

@DataClassName('DbWord')
class DbWordTable extends Table {
  @override
  Set<Column<Object>>? get primaryKey => {id};

  TextColumn get id => text()();

  TextColumn get value => text()();

  TextColumn get reading => text()();

  BoolColumn get isCommon => boolean()();

  IntColumn? get priority => integer().nullable()();

  TextColumn get meaningEntries => text().map(const ListConverter<MeaningEntry>(callback: MeaningEntry.fromJson))();
}

extension WordExtension on Word {
  DbWord get dbModel => DbWord(
        id: id,
        value: value,
        reading: reading,
        priority: priority,
        isCommon: isCommon,
        meaningEntries: meaningEntries,
      );
}

extension DbWordExtension on DbWord {
  Word get model => Word(
        id: id,
        value: value,
        reading: reading,
        priority: priority,
        isCommon: isCommon,
        meaningEntries: meaningEntries,
      );
}
