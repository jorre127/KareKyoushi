import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/widget/general/character/character_and_reading.dart';
import 'package:kare_kyoushi/widget/general/character/character_grade_label.dart';
import 'package:kare_kyoushi/widget/general/character/difficulty_grade_label.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_back_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailHeader extends StatelessWidget {
  final DifficultyGrade difficultyGrade;
  final Character character;
  final VoidCallback onCloseTapped;

  const CharacterDetailHeader({
    required this.difficultyGrade,
    required this.onCloseTapped,
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    IgnorePointer(
                      child: Opacity(
                        opacity: 0,
                        child: KKBackButton.light(
                          onClick: onCloseTapped,
                          fullScreen: true,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: DifficultyGradeLabel(difficultyGrade: difficultyGrade),
                      ),
                    ),
                    KKBackButton.light(
                      onClick: onCloseTapped,
                      fullScreen: true,
                    ),
                  ],
                ),
                const SizedBox(height: 48),
                CharacterAndReading(character: character),
                const SizedBox(height: 64),
              ],
            ),
          ),
          if (character.grade != null) ...[
            Positioned(
              bottom: 24,
              right: 48,
              child: Align(
                alignment: Alignment.centerRight,
                child: CharacterGradeLabel(characterGrade: character.grade!),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
