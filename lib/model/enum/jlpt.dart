import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum Jlpt {
  n5(
    titleKey: LocalizationKeys.n5Title,
    difficultyKey: LocalizationKeys.n5Difficulty,
    color: ThemeColors.accent5,
    rank: 5,
  ),
  n4(
    titleKey: LocalizationKeys.n4Title,
    difficultyKey: LocalizationKeys.n4Difficulty,
    color: ThemeColors.accent4,
    rank: 4,
  ),
  n3(
    titleKey: LocalizationKeys.n3Title,
    difficultyKey: LocalizationKeys.n3Difficulty,
    color: ThemeColors.accent3,
    rank: 3,
  ),
  n2(
    titleKey: LocalizationKeys.n2Title,
    difficultyKey: LocalizationKeys.n2Difficulty,
    color: ThemeColors.accent2,
    rank: 2,
  ),
  n1(
    titleKey: LocalizationKeys.n1Title,
    difficultyKey: LocalizationKeys.n1Difficulty,
    color: ThemeColors.accent1,
    rank: 1,
  ),
  ;

  final String titleKey;
  final String difficultyKey;
  final Color color;
  final int rank;

  const Jlpt({
    required this.titleKey,
    required this.difficultyKey,
    required this.color,
    required this.rank,
  });
}
