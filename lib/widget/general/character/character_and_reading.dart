import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/util/extension/character_extension.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterAndReading extends StatelessWidget {
  final Character character;
  final double spacing;
  final TextStyle? style;
  final bool showReading;

  const CharacterAndReading({
    required this.character,
    this.showReading = true,
    this.style,
    this.spacing = 4,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        return Column(
          children: [
            if (showReading) ...[
              Text(
                character.reading ?? '',
                style: theme.textThemes.xtraSubtleTextTheme.copySubtle,
              ),
              SizedBox(height: spacing),
            ],
            Text(
              character.value,
              style: style ?? theme.textThemes.coreTextTheme.copyHuge.copyWith(height: 1),
            ),
          ],
        );
      },
    );
  }
}
