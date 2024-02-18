import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_words_containing_item_body_item.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailListWordsContainingItemBody extends StatelessWidget {
  final Word word;

  const CharacterDetailListWordsContainingItemBody({
    required this.word,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: KKCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 12,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(ThemeDimens.tagBorderRadiusValue),
            bottomRight: Radius.circular(ThemeDimens.tagBorderRadiusValue),
          ),
          color: theme.colorsTheme.bgDefault,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: word.meaningEntries
                .mapIndexed(
                  (index, entry) => CharacterDetailWordsContainingItemBodyItem(
                    entry: entry,
                    index: index,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
