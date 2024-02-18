import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/widget/character_list/character_grid_item.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterGrid extends StatelessWidget {
  final List<Character> characters;
  final ValueChanged<Character> onCharacterTapped;

  const CharacterGrid({
    required this.characters,
    required this.onCharacterTapped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => GridView.builder(
        itemCount: characters.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 24,
          crossAxisSpacing: 24,
        ),
        padding: const EdgeInsets.all(24),
        itemBuilder: (context, index) {
          final characteritem = characters[index];
          return CharacterGridItem(
            character: characteritem,
            onTapped: () => onCharacterTapped(characteritem),
          );
        },
      ),
    );
  }
}
