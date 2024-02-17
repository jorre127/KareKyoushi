import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/general/kanji/jlpt_label.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_progress_bar.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGradeListItem extends StatelessWidget {
  final int total;
  final int current1;
  final int current2;
  final Jlpt jlptLevel;
  final VoidCallback? onTapped;

  const KanjiGradeListItem({
    required this.jlptLevel,
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
                JlptLabel(jlptLevel: jlptLevel),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    localization.getTranslation(jlptLevel.difficultyKey),
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
              progress1Color: jlptLevel.color,
              progress2Color: jlptLevel.colorDark,
              totalProgress: total,
            ),
          ],
        ),
      ),
    );
  }
}
