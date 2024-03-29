import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';
import 'package:kare_kyoushi/widget/general/action/action_item.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/general/character/difficulty_grade_label.dart';
import 'package:kare_kyoushi/widget/general/character/label.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailListWordsContainingItemHeader extends StatelessWidget {
  final Word word;
  final bool isExpanded;
  final VoidCallback onExpandTapped;

  const CharacterDetailListWordsContainingItemHeader({
    required this.word,
    required this.onExpandTapped,
    required this.isExpanded,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 4,
        ),
        child: KKCard(
          onTapped: onExpandTapped,
          color: theme.colorsTheme.bgDefault,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(ThemeDimens.tagBorderRadiusValue),
            topRight: Radius.circular(ThemeDimens.tagBorderRadiusValue),
            bottomLeft: Radius.circular(isExpanded ? 0 : ThemeDimens.tagBorderRadiusValue),
            bottomRight: Radius.circular(isExpanded ? 0 : ThemeDimens.tagBorderRadiusValue),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      word.reading,
                      style: theme.textThemes.subtleTextTheme.copyXtraSubtle.copyWith(height: 1),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      word.value,
                      style: theme.textThemes.coreTextTheme.copyDefault.copyWith(height: 1),
                    ),
                  ],
                ),
              ),
              SpacingRow(
                spacing: 8,
                children: [
                  if (word.isCommon) ...[
                    KKLabel(text: localization.common),
                  ],
                  DifficultyGradeLabel(
                    difficultyGrade: word.difficultyGrade,
                    style: DifficultyGradeTagStyle.simple,
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: ThemeDurations.shortAnimationDuration,
                    child: ActionItem(
                      svgAsset: ThemeAssets.chevronIcon,
                      onClick: onExpandTapped,
                      color: theme.colorsTheme.inverseIcon,
                      size: ThemeDimens.iconSize,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
