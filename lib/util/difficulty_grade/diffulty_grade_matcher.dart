import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';

@lazySingleton
class DifficultyGradeMatcher {
  static const _wordAssetPath = 'assets/jlpt_levels/words/';
  static const _kanjiAssetPath = 'assets/jlpt_levels/kanji/';
  final _difficultyGradetWordMap = <DifficultyGrade, List<String>>{};
  final _difficultyGradetKanjiMap = <DifficultyGrade, List<String>>{};

  Future<DifficultyGrade?> _matchDifficultyGrade({
    required String assetPath,
    required String word,
    required Map<DifficultyGrade, List<String>> difficultyGradetMap,
  }) async {
    if (difficultyGradetMap.isEmpty) {
      for (final level in DifficultyGrade.values) {
        final words = await rootBundle.loadString('${assetPath}n${level.rank}.txt');
        difficultyGradetMap[level] = LineSplitter.split(words).toList();
      }
    }
    for (final level in difficultyGradetMap.keys) {
      if (difficultyGradetMap[level]?.contains(word) ?? false) return level;
    }
    return null;
  }

  Future<DifficultyGrade?> getLevelForWord(String word) => _matchDifficultyGrade(
        assetPath: _wordAssetPath,
        word: word,
        difficultyGradetMap: _difficultyGradetWordMap,
      );

    Future<DifficultyGrade?> getLevelForKanji(String kanji) => _matchDifficultyGrade(
        assetPath: _kanjiAssetPath,
        word: kanji,
        difficultyGradetMap: _difficultyGradetKanjiMap,
      );
}
