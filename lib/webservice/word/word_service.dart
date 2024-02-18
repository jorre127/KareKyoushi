import 'package:collection/collection.dart';
import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/wordtype.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/util/extension/xml_extension.dart';
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart';
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
    final xmlDocument = XmlDocument.parse(kanjiXml);
    final dictionary = xmlDocument.findElements('JMdict').first;
    final wordEntries = dictionary.findElements('entry');

    final words = <Word>[];
    for (final word in wordEntries) {
      final id = word.getElementValue('ent_seq')!;
      final value = word.getElement('k_ele')?.getElementValue('keb');
      final priority = word.getElement('k_ele')?.findElements('ke_pri').map((e) => e.innerText).toList();
      final wordInfo = word.getElement('r_ele');
      final reading = wordInfo!.getElementValue('reb')!;
      final meaningsInfo = word.findElements('sense');

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
      words.add(
        Word(
          id: id,
          value: value ?? '',
          difficultyGrade: value == null ? null : await _matcher.getLevelForWord(value),
          reading: reading,
          isCommon: priority?.any((priority) => _commonPriorities.contains(priority)) ?? false,
          priority: int.tryParse(priority?.firstWhereOrNull((priority) => priority.contains('nf'))?.substring(2) ?? ''),
          meaningEntries: meaningEntries,
        ),
      );
    }
    return words;
  }
}
