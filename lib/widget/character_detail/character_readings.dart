import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/util/extension/character_extension.dart';
import 'package:kare_kyoushi/widget/character_detail/character_readings_section.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterReadings extends StatelessWidget {
  final bool isKanji;
  final Color selectedColor;
  final String? selectedReading;
  final Character character;
  final ValueChanged<String> onReadingTapped;

  const CharacterReadings({
    required this.character,
    required this.isKanji,
    required this.onReadingTapped,
    required this.selectedColor,
    required this.selectedReading,
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
          if (isKanji) ...[
            CharacterReadingsSection(
              title: localization.kanjiDetailScreenKanjiReadingKunyomi,
              readings: character.kunyomi,
              onReadingTapped: onReadingTapped,
              selectedColor: selectedColor,
              selectedReading: selectedReading,
            ),
            const SizedBox(height: 8),
            CharacterReadingsSection(
              title: localization.kanjiDetailScreenKanjiReadingOnyomi,
              readings: character.onyomi,
              onReadingTapped: onReadingTapped,
              selectedColor: selectedColor,
              selectedReading: selectedReading,
            ),
          ] else ...[
            Text(
              character.reading ?? '',
              style: theme.textThemes.coreTextTheme.copyDefault,
            ),
          ]
        ],
      ),
    );
  }
}
