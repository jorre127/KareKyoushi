import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/widget/character_detail/character_readings_section_item.dart';
import 'package:kare_kyoushi/widget/layout/spacing_row.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailWordsContainingTitle extends StatelessWidget {
  final Character character;
  final String? selectedReading;
  final VoidCallback onRemoveTapped;

  const CharacterDetailWordsContainingTitle({
    required this.character,
    required this.selectedReading,
    required this.onRemoveTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DataProviderWidget(childBuilder: (context, theme, localization) {
        return Container(
          color: theme.colorsTheme.bgCard,
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          child: SpacingRow(
            spacing: 4,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  localization.kanjiDetailScreenWordsContaining,
                  style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
                ),
              ),
              Text(
                character.value,
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
              Text(
                ':',
                style: theme.textThemes.xtraSubtleTextTheme.titleSubHeader,
              ),
              if (selectedReading != null) ...[
                const SizedBox(width: 4),
                CharacterReadingsSectionItem(
                  reading: selectedReading ?? '',
                  selectedReading: selectedReading,
                  showClose: true,
                  onReadingTapped: (_) => onRemoveTapped(),
                  selectedColor: character.difficultyGrade.color,
                ),
              ],
            ],
          ),
        );
      }),
    );
  }
}
