import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/util/extension/xml_extension.dart';
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
      final kanjiValue = character.getElementValue('literal')!;
      final misc = character.getElement('misc')!;
      final jlptString = misc.getElementValue('jlpt');
      final grade = misc.getElementValue('grade');
      final frequency = misc.getElementValue('freq');
      final readingMeaning = character.getElement('reading_meaning')?.getElement('rmgroup');
      final meanings = readingMeaning?.findElements('meaning').where((element) => element.attributes.isEmpty);
      final onyomi = readingMeaning?.findElements('reading').where((element) => element.attributes.first.value.toString() == 'ja_on');
      final kunyomi = readingMeaning?.findElements('reading').where((element) => element.attributes.first.value.toString() == 'ja_kun');
      final jlpt = jlptString == null ? null : Jlpt.values.firstWhere((jlptLevel) => jlptLevel.rank == int.parse(jlptString));

      kanji.add(
        Kanji(
          kanjiValue: kanjiValue,
          jlpt: jlpt,
          frequency: int.tryParse(frequency ?? ''),
          grade: int.tryParse(grade ?? ''),
          kunyomi: kunyomi?.map((e) => e.innerText).toList() ?? [],
          onyomi: onyomi?.map((e) => e.innerText).toList() ?? [],
          meanings: meanings?.map((e) => e.innerText).toList() ?? [],
          knowledgeLevel: null,
        ),
      );
    }
    return kanji;
  }
}
