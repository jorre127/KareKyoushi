import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/character_detail/character_readings_section_item.dart';
import 'package:kare_kyoushi/widget/layout/spacing_wrap.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterReadingsSection extends StatelessWidget {
  final String title;
  final List<String> readings;
  final ValueChanged<String> onReadingTapped;
  final Color selectedColor;
  final String? selectedReading;

  const CharacterReadingsSection({
    required this.title,
    required this.readings,
    required this.onReadingTapped,
    required this.selectedColor,
    required this.selectedReading,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (contex, theme, localization) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: theme.textThemes.coreTextTheme.copySubtle,
            ),
            const SizedBox(height: 2),
            SpacingWrap(
              spacing: 4,
              children: readings
                  .map((reading) => CharacterReadingsSectionItem(
                        reading: reading,
                        onReadingTapped: onReadingTapped,
                        selectedColor: selectedColor,
                        selectedReading: selectedReading,
                      ))
                  .toList(),
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
