import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/util/extension/xml_extension.dart';
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart';
import 'package:xml/xml.dart';

@lazySingleton
class CharacterService {
  final DifficultyGradeMatcher _difficultyGradeMatcher;

  static const _kanjiXmlPath = 'assets/dictionary/kanjidic2.xml';

  CharacterService(this._difficultyGradeMatcher);

  Future<List<Character>> getCharacters() async {
    final kanjiXml = await rootBundle.loadString(_kanjiXmlPath);
    final xmlDocument = XmlDocument.parse(kanjiXml);
    final dictionary = xmlDocument.findElements('kanjidic2').first;
    final charactersElements = dictionary.findElements('character');

    final characters = <Character>[];
    for (final kanji in charactersElements) {
      final kanjiValue = kanji.getElementValue('literal')!;
      final misc = kanji.getElement('misc')!;
      final grade = misc.getElementValue('grade');
      final frequency = misc.getElementValue('freq');
      final readingMeaning = kanji.getElement('reading_meaning')?.getElement('rmgroup');
      final meanings = readingMeaning?.findElements('meaning').where((element) => element.attributes.isEmpty);
      final onyomi = readingMeaning?.findElements('reading').where((element) => element.attributes.first.value.toString() == 'ja_on');
      final kunyomi = readingMeaning?.findElements('reading').where((element) => element.attributes.first.value.toString() == 'ja_kun');

      characters.add(
        Character(
          value: kanjiValue,
          alphbabet: Alphabet.kanji,
          difficultyGrade: await _difficultyGradeMatcher.getLevelForKanji(kanjiValue),
          frequency: int.tryParse(frequency ?? ''),
          grade: int.tryParse(grade ?? ''),
          kunyomi: kunyomi?.map((e) => e.innerText).toList() ?? [],
          onyomi: onyomi?.map((e) => e.innerText).toList() ?? [],
          meanings: meanings?.map((e) => e.innerText).toList() ?? [],
          knowledgeLevel: null,
        ),
      );
    }
    return characters;
  }
}
