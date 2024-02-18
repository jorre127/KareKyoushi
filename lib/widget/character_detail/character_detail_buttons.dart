import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterDetailButtons extends StatelessWidget {
  final VoidCallback onMehTapped;
  final VoidCallback onGotItTapped;
  final Character character;

  const CharacterDetailButtons({
    required this.onMehTapped,
    required this.onGotItTapped,
    required this.character,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorsTheme.bgCard,
          borderRadius: ThemeDimens.hugeCardBorderRadius,
          border: Border.all(color: theme.colorsTheme.stroke),
          boxShadow: theme.shadows.cardShadow,
        ),
        child: Row(
          children: [
            Expanded(
              child: KKButton(
                text: localization.kanjiDetailMeh,
                onClick: onMehTapped,
                color: character.knowledgeLevel == KnowledgeLevel.meh ? character.difficultyGrade?.colorDark : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: KKButton(
                text: localization.kanjiDetailGotIt,
                onClick: onGotItTapped,
                  color: character.knowledgeLevel == KnowledgeLevel.gotIt ? character.difficultyGrade?.color : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
