import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart';
import 'package:kare_kyoushi/util/extension/xml_extension.dart';
import 'package:xml/xml.dart';

@lazySingleton
class CharacterService {
  final DifficultyGradeMatcher _difficultyGradeMatcher;

  static const _kanjiXmlPath = 'assets/dictionary/kanjidic2.xml';
  static const _hiraganaXmlPath = 'assets/dictionary/kana/hiragana.txt';
  static const _katakanaXmlPath = 'assets/dictionary/kana/katakana.txt';

  CharacterService(this._difficultyGradeMatcher);

  Future<List<Character>> getCharacters() async {
    final characters = <Character>[];
    characters.addAll(await _getKanji());
    characters.addAll(await _getHiragana());
    characters.addAll(await _getKatakana());
    return characters;
  }

  Future<List<Character>> _getHiragana() => _getKana(
        kanaPath: _hiraganaXmlPath,
        alphabet: Alphabet.hiragana,
      );

  Future<List<Character>> _getKatakana() => _getKana(
        kanaPath: _katakanaXmlPath,
        alphabet: Alphabet.katakana,
      );

  Future<List<Character>> _getKana({
    required String kanaPath,
    required Alphabet alphabet,
  }) async {
    final characters = <Character>[];
    final charactersList = LineSplitter.split(await rootBundle.loadString(kanaPath));

    for (final character in charactersList) {
      final splittedCharacters = character.split(' ');
      final value = splittedCharacters[0];
      final reading = splittedCharacters[1];
      final difficultyGrade = DifficultyGrade.values.firstWhere((grade) => grade.rank == int.parse(splittedCharacters[2]));
      characters.add(
        Character(
          alphbabet: alphabet,
          value: value,
          kunyomi: [reading],
          onyomi: const [],
          meanings: const [],
          grade: null,
          frequency: null,
          knowledgeLevel: null,
          difficultyGrade: difficultyGrade,
        ),
      );
    }
    return characters;
  }

  Future<List<Character>> _getKanji() async {
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
