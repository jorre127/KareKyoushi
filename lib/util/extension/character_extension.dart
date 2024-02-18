import 'package:kare_kyoushi/model/character/character.dart';

extension CharacterExtension on Character {
  String? get reading {
    final kunyomiReading = kunyomi.isEmpty ? null : kunyomi.first;
    final onyomiReading = onyomi.isEmpty ? null : onyomi.first;
    return kunyomiReading ?? onyomiReading;
  }
}
