import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiDetailButtons extends StatelessWidget {
  final VoidCallback onMehTapped;
  final VoidCallback onGotItTapped;
  final Kanji kanji;

  const KanjiDetailButtons({
    required this.onMehTapped,
    required this.onGotItTapped,
    required this.kanji,
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
                color: kanji.knowledgeLevel == KnowledgeLevel.meh ? kanji.jlpt?.colorDark : null,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: KKButton(
                text: localization.kanjiDetailGotIt,
                onClick: onGotItTapped,
                  color: kanji.knowledgeLevel == KnowledgeLevel.gotIt ? kanji.jlpt?.color : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
