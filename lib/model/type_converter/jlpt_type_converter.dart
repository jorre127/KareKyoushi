import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';

class JlptTypeConverter extends TypeConverter<Jlpt?, int?> {
  const JlptTypeConverter();

  @override
  Jlpt? fromSql(int? fromDb) {
    final intValue = Jlpt.values.where((jlpt) => jlpt.rank == fromDb);
    if (intValue.isEmpty) return null;
    return intValue.first;
  }

  @override
  int? toSql(Jlpt? value) => value?.rank;
}
