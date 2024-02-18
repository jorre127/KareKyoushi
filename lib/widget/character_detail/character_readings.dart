import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/widget/character_detail/character_readings_section.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterReadings extends StatelessWidget {
  final Character character;

  const CharacterReadings({
    required this.character,
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
          CharacterReadingsSection(
            title: localization.kanjiDetailScreenKanjiReadingKunyomi,
            readings: character.kunyomi,
          ),
          const SizedBox(height: 8),
          CharacterReadingsSection(
            title: localization.kanjiDetailScreenKanjiReadingOnyomi,
            readings: character.onyomi,
          ),
        ],
      ),
    );
  }
}
