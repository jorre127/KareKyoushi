import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_readings_section.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiReadings extends StatelessWidget {
  final Kanji kanji;

  const KanjiReadings({
    required this.kanji,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            localization.kanjiDetailScreenKanjReading,
            style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
          ),
          const SizedBox(height: 2),
          KanjiReadingsSection(
            title: localization.kanjiDetailScreenKanjiReadingKunyomi,
            readings: kanji.kunyomi,
          ),
          const SizedBox(height: 8),
          KanjiReadingsSection(
            title: localization.kanjiDetailScreenKanjiReadingOnyomi,
            readings: kanji.onyomi,
          ),
        ],
      ),
    );
  }
}
