import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';

class DifficultyGradeTypeConverter extends TypeConverter<DifficultyGrade?, int?> {
  const DifficultyGradeTypeConverter();

  @override
  DifficultyGrade? fromSql(int? fromDb) {
    final intValue = DifficultyGrade.values.where((difficultyGrade) => difficultyGrade.rank == fromDb);
    if (intValue.isEmpty) return null;
    return intValue.first;
  }

  @override
  int? toSql(DifficultyGrade? value) => value?.rank;
}
