import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/util/locale/localization.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/general/kanji/label.dart';

class KanjiDetailWordsContaining extends StatelessWidget {
  final KKTheme theme;
  final Localization localization;
  final List<Word> words;

  const KanjiDetailWordsContaining({
    required this.words,
    required this.theme,
    required this.localization,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SliverList.builder(
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 4,
            ),
            child: KKCard(
              color: theme.colorsTheme.bgDefault,
              borderRadius: ThemeDimens.tagBorderRadius,
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
                  if (word.isCommon) ...[
                    KKLabel(text: localization.common),
                  ]
                ],
              ),
            ),
          );
        },
      );
}
