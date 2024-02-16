import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';
import 'package:kare_kyoushi/widget/kanji_detail/kanji_meanings.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiDetailWordsContainingItemBodyItem extends StatelessWidget {
  final int index;
  final MeaningEntry entry;

  const KanjiDetailWordsContainingItemBodyItem({
    required this.entry,
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${index + 1}. ${localization.getTranslation(entry.type?.titleKey ?? entry.typeString)}',
            style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
          ),
          const SizedBox(height: 2),
          KanjiMeanings(
            kanjiMeanings: entry.meanings,
            showTitle: false,
          ),
        ],
      ),
    );
  }
}
