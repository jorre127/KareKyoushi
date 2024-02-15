import 'package:kare_kyoushi/model/kanji/kanji.dart';

extension KanjiExtension on Kanji {
  String? get reading {
    final kunyomiReading = kunyomi.isEmpty ? null : kunyomi.first;
    final onyomiReading = onyomi.isEmpty ? null : onyomi.first;
    return kunyomiReading ?? onyomiReading;
  }
}
