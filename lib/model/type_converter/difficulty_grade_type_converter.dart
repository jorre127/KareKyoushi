import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';

class DifficultyGradeTypeConverter extends TypeConverter<DifficultyGrade, int> {
  const DifficultyGradeTypeConverter();

  @override
  DifficultyGrade fromSql(int fromDb) => DifficultyGrade.values.where((difficultyGrade) => difficultyGrade.rank == fromDb).first;

  @override
  int toSql(DifficultyGrade value) => value.rank;
}
