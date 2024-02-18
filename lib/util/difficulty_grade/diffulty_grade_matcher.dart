import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';

@lazySingleton
class DifficultyGradeMatcher {
  static const _wordAssetPath = 'assets/jlpt_levels/words/';
  static const _kanjiAssetPath = 'assets/jlpt_levels/kanji/';
  final _difficultyGradeWordMap = <DifficultyGrade, List<String>>{};
  final _difficultyGradeKanjiMap = <DifficultyGrade, List<String>>{};

  Future<DifficultyGrade?> _matchDifficultyGrade({
    required String assetPath,
    required String word,
    required Map<DifficultyGrade, List<String>> difficultyGradeMap,
  }) async {
    if (difficultyGradeMap.isEmpty) {
      for (final level in Alphabet.kanji.levels) {
        final words = await rootBundle.loadString('${assetPath}n${level.rank}.txt');
        difficultyGradeMap[level] = LineSplitter.split(words).toList();
      }
    }
    for (final level in difficultyGradeMap.keys) {
      if (difficultyGradeMap[level]?.contains(word) ?? false) return level;
    }
    return null;
  }

  Future<DifficultyGrade?> getLevelForWord(String word) => _matchDifficultyGrade(
        assetPath: _wordAssetPath,
        word: word,
        difficultyGradeMap: _difficultyGradeWordMap,
      );

  Future<DifficultyGrade?> getLevelForKanji(String kanji) => _matchDifficultyGrade(
        assetPath: _kanjiAssetPath,
        word: kanji,
        difficultyGradeMap: _difficultyGradeKanjiMap,
      );
}
