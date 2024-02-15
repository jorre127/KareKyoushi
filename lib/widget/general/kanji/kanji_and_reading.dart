import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/util/extension/kanji_extension.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiAndReading extends StatelessWidget {
  final Kanji kanji;
  final double spacing;
  final TextStyle? style;

  const KanjiAndReading({
    required this.kanji,
    this.style,
    this.spacing = 8,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        return Column(
          children: [
            Text(
              kanji.reading ?? '',
              style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
            ),
            SizedBox(height: spacing),
            Text(
              kanji.kanjiValue,
              style: style ?? theme.textThemes.coreTextTheme.copyHuge.copyWith(height: 1),
            ),
          ],
        );
      },
    );
  }
}
