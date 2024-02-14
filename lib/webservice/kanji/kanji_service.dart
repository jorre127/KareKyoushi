import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:xml/xml.dart';

@lazySingleton
class KanjiService {
  static const _kanjiXmlPath = 'assets/dictionary/kanjidic2.xml';

  KanjiService();

  Future<void> getKanji() async {
    final kanjiXml = await rootBundle.loadString(_kanjiXmlPath);
    final xmlDocument = XmlDocument.parse(kanjiXml);
    final dictionary = xmlDocument.findElements('kanjidic2').first;
    final characters = dictionary.findElements('character');

    print(characters.length);
  }
}
