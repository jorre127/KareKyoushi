import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/layout/spacing_wrap.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterMeanings extends StatelessWidget {
  final bool showTitle;
  final List<String> characterMeanings;

  const CharacterMeanings({
    required this.characterMeanings,
    this.showTitle = true,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (showTitle) ...[
              Text(
                localization.kanjiDetailScreenKanjiMeaning,
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
              const SizedBox(height: 2),
            ],
            SpacingWrap(
              spacing: 4,
              children: characterMeanings.map((reading) => Text(reading, style: theme.textThemes.coreTextTheme.copyDefault)).toList(),
              separatorBuilder: (context) => Text(
                ',',
                style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
              ),
            ),
          ],
        );
      },
    );
  }
}
