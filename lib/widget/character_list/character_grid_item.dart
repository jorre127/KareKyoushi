import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/styles/theme_data.dart';
import 'package:kare_kyoushi/util/extension/character_extension.dart';
import 'package:kare_kyoushi/widget/general/card/kare_kyoushi_card.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterGridItem extends StatefulWidget {
  final Character character;
  final VoidCallback? onTapped;

  const CharacterGridItem({
    required this.character,
    this.onTapped,
    super.key,
  });

  @override
  State<CharacterGridItem> createState() => _CharacterGridItemState();
}

class _CharacterGridItemState extends State<CharacterGridItem> {
  final LayerLink layerLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        final cardColor = _getColor(theme);

        return KKCard(
          padding: EdgeInsets.zero,
          onTapped: widget.onTapped,
          color: cardColor,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CompositedTransformTarget(
                  link: layerLink,
                  child: Text(
                    widget.character.value,
                    style: theme.textThemes.coreTextTheme.copyBig.copyWith(height: 1),
                  ),
                ),
                CompositedTransformFollower(
                  link: layerLink,
                  followerAnchor: Alignment.bottomCenter,
                  targetAnchor: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      widget.character.reading ?? '',
                      style: theme.textThemes.subtleTextTheme.copyXtraSubtle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Color? _getColor(KKTheme theme) => switch (widget.character.knowledgeLevel) {
        KnowledgeLevel.gotIt => widget.character.difficultyGrade?.color,
        KnowledgeLevel.meh => widget.character.difficultyGrade?.colorDark,
        null => theme.colorsTheme.bgCard,
      };
}
