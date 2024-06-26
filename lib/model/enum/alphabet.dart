import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum Alphabet {
  hiragana(
    titleKey: LocalizationKeys.hiragana,
    titleJpKey: LocalizationKeys.hiraganaJp,
    color: ThemeColors.accent5,
    levels: [
      DifficultyGrade.standard,
      DifficultyGrade.dakuten,
      DifficultyGrade.combined,
    ],
    value: 'Hiragana',
  ),
  katakana(
    titleKey: LocalizationKeys.katakana,
    titleJpKey: LocalizationKeys.katakanaJp,
    color: ThemeColors.accent3,
    levels: [
      DifficultyGrade.standard,
      DifficultyGrade.dakuten,
      DifficultyGrade.combined,
    ],
    value: 'Katakana',
  ),
  kanji(
    titleKey: LocalizationKeys.kanji,
    titleJpKey: LocalizationKeys.kanjiJp,
    color: ThemeColors.accent1,
    value: 'Kanji',
    levels: [
      DifficultyGrade.n5,
      DifficultyGrade.n4,
      DifficultyGrade.n3,
      DifficultyGrade.n2,
      DifficultyGrade.n1,
      DifficultyGrade.unkown,
    ],
  );

  final Color color;
  final String titleKey;
  final String titleJpKey;
  final String value;
  final List<DifficultyGrade> levels;

  const Alphabet({
    required this.titleKey,
    required this.titleJpKey,
    required this.color,
    required this.levels,
    required this.value,
  });
}
