import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:xml/xml.dart';

@lazySingleton
class KanjiService {
  static const _kanjiXmlPath = 'assets/dictionary/kanjidic2.xml';

  KanjiService();

  Future<List<Kanji>> getKanji() async {
    final kanjiXml = await rootBundle.loadString(_kanjiXmlPath);
    final xmlDocument = XmlDocument.parse(kanjiXml);
    final dictionary = xmlDocument.findElements('kanjidic2').first;
    final characters = dictionary.findElements('character');

    final kanji = <Kanji>[];
    for (final character in characters) {
      final kanjiValue = character.findElements('literal').first.innerText;
      final jlptString = character.findElements('misc').first.findElements('jlpt').firstOrNull?.innerText;
      final jlpt = jlptString == null ? null : Jlpt.values.firstWhere((jlptLevel) => jlptLevel.rank == int.parse(jlptString));
      kanji.add(
        Kanji(
          kanjiValue: kanjiValue,
          jlpt: jlpt,
        ),
      );
    }
    return kanji;
  }
}
