import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/enum/wordtype.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart';
import 'package:kare_kyoushi/util/extension/xml_extension.dart';
import 'package:xml/xml.dart';

@lazySingleton
class WordService {
  final DifficultyGradeMatcher _matcher;

  static const _wordsXmlPath = 'assets/dictionary/JMdict_e.xml';
  static const _commonPriorities = [
    "news1",
    "ichi1",
    "spec1",
    "gai1",
  ];

  WordService(this._matcher);

  Future<List<Word>> getWords() async {
    final kanjiXml = await rootBundle.loadString(_wordsXmlPath);
    final xmlDocument = await compute(XmlDocument.parse, kanjiXml);
    final dictionary = xmlDocument.findElements('JMdict').first;
    final wordEntries = dictionary.findElements('entry');

    final parsedWords = await _parseWords(wordEntries);
    return parsedWords;
  }

  Future<List<Word>> _parseWords(Iterable<XmlElement> elements) async {
    final words = <Word>[];
    for (final element in elements) {
      final id = element.getElementValue('ent_seq')!;
      final value = element.getElement('k_ele')?.getElementValue('keb');
      final priority = element.getElement('k_ele')?.findElements('ke_pri').map((e) => e.innerText).toList();
      final wordInfo = element.getElement('r_ele');
      final reading = wordInfo!.getElementValue('reb')!;
      final meaningsInfo = element.findElements('sense');

      final meaningEntries = <MeaningEntry>[];

      for (final meaningEntry in meaningsInfo) {
        final typeString = meaningEntry.getElementValue('pos')!;
        meaningEntries.add(
          MeaningEntry(
            typeString: typeString,
            type: typeString.toWordType(),
            meanings: meaningEntry.findAllElements('gloss').map((e) => e.innerText).toList(),
            misc: meaningEntry.getElementValue('misc'),
          ),
        );
      }
      words.add(Word(
        id: id,
        value: value ?? '',
        difficultyGrade: value == null ? DifficultyGrade.unkown : await _matcher.getLevelForWord(value) ?? DifficultyGrade.unkown,
        reading: reading,
        isCommon: priority?.any((priority) => _commonPriorities.contains(priority)) ?? false,
        priority: int.tryParse(priority?.firstWhereOrNull((priority) => priority.contains('nf'))?.substring(2) ?? ''),
        meaningEntries: meaningEntries,
      ));
    }
    return words;
  }
}
