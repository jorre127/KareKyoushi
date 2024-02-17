import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum Alphbabet {
  hiragana(
    titleKey: LocalizationKeys.hiragana,
    titleJpKey: LocalizationKeys.hiraganaJp,
    color: ThemeColors.accent5,
    levels: [],
  ),
  katakana(
    titleKey: LocalizationKeys.katakana,
    titleJpKey: LocalizationKeys.katakanaJp,
    color: ThemeColors.accent1,
    levels: [],
  ),
  kanji(
    titleKey: LocalizationKeys.kanji,
    titleJpKey: LocalizationKeys.kanjiJp,
    color: ThemeColors.accent3,
    levels: [
      Jlpt.n1,
      Jlpt.n2,
      Jlpt.n3,
      Jlpt.n4,
      Jlpt.n5,
    ],
  );

  final String titleKey;
  final String titleJpKey;
  final Color color;
  final List<Jlpt> levels;

  const Alphbabet({
    required this.titleKey,
    required this.titleJpKey,
    required this.color,
    required this.levels,
  });
}
