import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum DifficultyGrade {
  standard(
    titleKey: LocalizationKeys.standardTitle,
    difficultyKey: '',
    color: ThemeColors.accent5,
    colorDark: ThemeColors.accent5Dark,
    rank: 8,
  ),
  dakuten(
    titleKey: LocalizationKeys.dakutenTitle,
    difficultyKey: '',
    color: ThemeColors.accent3,
    colorDark: ThemeColors.accent3Dark,
    rank: 7,
  ),
  combined(
    titleKey: LocalizationKeys.combinedTitle,
    difficultyKey: '',
    color: ThemeColors.accent1,
    colorDark: ThemeColors.accent1Dark,
    rank: 6,
  ),
  n5(
    titleKey: LocalizationKeys.n5Title,
    difficultyKey: LocalizationKeys.n5Difficulty,
    color: ThemeColors.accent5,
    colorDark: ThemeColors.accent5Dark,
    rank: 5,
  ),
  n4(
    titleKey: LocalizationKeys.n4Title,
    difficultyKey: LocalizationKeys.n4Difficulty,
    color: ThemeColors.accent4,
    colorDark: ThemeColors.accent4Dark,
    rank: 4,
  ),
  n3(
    titleKey: LocalizationKeys.n3Title,
    difficultyKey: LocalizationKeys.n3Difficulty,
    color: ThemeColors.accent3,
    colorDark: ThemeColors.accent3Dark,
    rank: 3,
  ),
  n2(
    titleKey: LocalizationKeys.n2Title,
    difficultyKey: LocalizationKeys.n2Difficulty,
    color: ThemeColors.accent2,
    colorDark: ThemeColors.accent2Dark,
    rank: 2,
  ),
  n1(
    titleKey: LocalizationKeys.n1Title,
    difficultyKey: LocalizationKeys.n1Difficulty,
    color: ThemeColors.accent1,
    colorDark: ThemeColors.accent1Dark,
    rank: 1,
  ),
  unkown(
    titleKey: LocalizationKeys.unkownTitle,
    difficultyKey: LocalizationKeys.unkownDifficulty,
    color: ThemeColors.accent6,
    colorDark: ThemeColors.accent6Dark,
    rank: 0,
  ),
  ;

  final String titleKey;
  final String difficultyKey;
  final Color color;
  final Color colorDark;
  final int rank;

  const DifficultyGrade({
    required this.titleKey,
    required this.difficultyKey,
    required this.color,
    required this.colorDark,
    required this.rank,
  });
}
