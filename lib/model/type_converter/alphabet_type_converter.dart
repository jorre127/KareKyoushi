import 'package:drift/drift.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';

class AlphabetTypeConverter extends TypeConverter<Alphabet, String> {
  const AlphabetTypeConverter();

  @override
  Alphabet fromSql(String fromDb) => Alphabet.values.where((alphabet) => alphabet.value == fromDb).first;

  @override
  String toSql(Alphabet value) => value.value;
}
