import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGrid extends StatelessWidget {
  final List<Kanji> kanji;

  const KanjiGrid({
    required this.kanji,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => GridView.builder(
        itemCount: kanji.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          final kanjiItem = kanji[index];
          return KKCard(
            child: Center(
              child: Text(
                kanjiItem.kanjiValue,
                style: theme.textThemes.coreTextTheme.copyBig,
              ),
            ),
          );
        },
      ),
    );
  }
}
