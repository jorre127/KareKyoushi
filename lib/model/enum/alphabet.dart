import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum Alphbabet {
  hiragana(
    titleKey: LocalizationKeys.hiragana,
    titleJpKey: LocalizationKeys.hiraganaJp,
    color: ThemeColors.accent5,
  ),
  katakana(
    titleKey: LocalizationKeys.katakana,
    titleJpKey: LocalizationKeys.katakanaJp,
    color: ThemeColors.accent1,
  ),
  kanji(
    titleKey: LocalizationKeys.kanji,
    titleJpKey: LocalizationKeys.kanjiJp,
    color: ThemeColors.accent3,
  );

  final String titleKey;
  final String titleJpKey;
  final Color color;

  const Alphbabet({
    required this.titleKey,
    required this.titleJpKey,
    required this.color,
  });
}
