import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/widget/general/kanji/jlpt_label.dart';
import 'package:kare_kyoushi/widget/general/kanji/kanji_and_reading.dart';
import 'package:kare_kyoushi/widget/general/kanji/kanji_grade_label.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiDetailHeader extends StatelessWidget {
  final Jlpt jlptLevel;
  final Kanji kanji;
  final VoidCallback onCloseTapped;

  const KanjiDetailHeader({
    required this.jlptLevel,
    required this.onCloseTapped,
    required this.kanji,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              children: [
                IgnorePointer(
                  child: Opacity(
                    opacity: 0,
                    child: KKBackButton.light(
                      onClick: onCloseTapped,
                      fullScreen: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: JlptLabel(jlptLevel: jlptLevel),
                  ),
                ),
                KKBackButton.light(
                  onClick: onCloseTapped,
                  fullScreen: true,
                ),
              ],
            ),
            const SizedBox(height: 48),
            KanjiAndReading(kanji: kanji),
            if (kanji.grade != null) ...[
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: KanjiGradeLabel(kanjiGrade: kanji.grade!),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
