import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/meaning_entry.dart';
import 'package:kare_kyoushi/widget/character_detail/character_meanings.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailWordsContainingItemBodyItem extends StatelessWidget {
  final int index;
  final MeaningEntry entry;

  const CharacterDetailWordsContainingItemBodyItem({
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
          CharacterMeanings(
            characterMeanings: entry.meanings,
            showTitle: false,
          ),
        ],
      ),
    );
  }
}
