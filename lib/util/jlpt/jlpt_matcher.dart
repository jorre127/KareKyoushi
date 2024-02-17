import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';

@lazySingleton
class JlptMatcher {
  static const _wordAssetPath = 'assets/jlpt_levels/words/';
  static const _kanjiAssetPath = 'assets/jlpt_levels/kanji/';
  final _jlptWordMap = <Jlpt, List<String>>{};
  final _jlptKanjiMap = <Jlpt, List<String>>{};

  Future<Jlpt?> _matchJlpt({
    required String assetPath,
    required String word,
    required Map<Jlpt, List<String>> jlptMap,
  }) async {
    if (jlptMap.isEmpty) {
      for (final level in Jlpt.values) {
        final words = await rootBundle.loadString('${assetPath}n${level.rank}.txt');
        jlptMap[level] = LineSplitter.split(words).toList();
      }
    }
    for (final level in jlptMap.keys) {
      if (jlptMap[level]?.contains(word) ?? false) return level;
    }
    return null;
  }

  Future<Jlpt?> getLevelForWord(String word) => _matchJlpt(
        assetPath: _wordAssetPath,
        word: word,
        jlptMap: _jlptWordMap,
      );

    Future<Jlpt?> getLevelForKanji(String kanji) => _matchJlpt(
        assetPath: _kanjiAssetPath,
        word: kanji,
        jlptMap: _jlptKanjiMap,
      );
}
