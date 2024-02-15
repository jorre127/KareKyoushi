import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/kanji_grade/kanji_grade_label.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGradeListItem extends StatelessWidget {
  final int total;
  final Jlpt jlptLevel;
  final VoidCallback? onTapped;

  const KanjiGradeListItem({
    required this.jlptLevel,
    required this.total,
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
                KanjiGradeLabel(jlptLevel: jlptLevel),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    localization.getTranslation(jlptLevel.difficultyKey),
                    style: theme.textThemes.coreTextTheme.copyDefault,
                  ),
                ),
                Text(
                  '$total ${localization.kanjiJp}',
                  style: theme.textThemes.subtleTextTheme.copySubtle,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
