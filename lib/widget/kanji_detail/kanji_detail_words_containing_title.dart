import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiDetailWordsContainingTitle extends StatelessWidget {
  final Kanji kanji;

  const KanjiDetailWordsContainingTitle({
    required this.kanji,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DataProviderWidget(childBuilder: (context, theme, localization) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: SpacingRow(
            spacing: 4,
            children: [
              Text(
                localization.kanjiDetailScreenWordsContaining,
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
              Text(
                kanji.kanjiValue,
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
              Text(
                ':',
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
            ],
          ),
        );
      }),
    );
  }
}
