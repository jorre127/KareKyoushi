import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/general/character/difficulty_grade_label.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_bar.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterGradeListItem extends StatelessWidget {
  final int total;
  final int current1;
  final int current2;
  final DifficultyGrade difficultyGrade;
  final VoidCallback? onTapped;

  const CharacterGradeListItem({
    required this.difficultyGrade,
    required this.total,
    required this.current1,
    required this.current2,
    this.onTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => KKCard(
        padding: const EdgeInsets.all(16),
        onTapped: onTapped,
        child: Column(
          children: [
            Row(
              children: [
                DifficultyGradeLabel(difficultyGrade: difficultyGrade),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    localization.getTranslation(difficultyGrade.difficultyKey),
                    style: theme.textThemes.coreTextTheme.copyDefault,
                  ),
                ),
                SpacingRow(
                  spacing: 2,
                  separatorBuilder: (context) => Text(
                    '/',
                    style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
                  ),
                  children: [
                    Text(
                      (current1 + current2).toString(),
                      style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
                    ),
                    Text(
                      '$total ${localization.kanjiJp}',
                      style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            KKProgressBar(
              progress1: current1,
              progress2: current2,
              progress1Color: difficultyGrade.color,
              progress2Color: difficultyGrade.colorDark,
              totalProgress: total,
            ),
          ],
        ),
      ),
    );
  }
}
