import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/general/character/label.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class CharacterGradeLabel extends StatelessWidget {
  final int characterGrade;

  const CharacterGradeLabel({
    required this.characterGrade,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => KKLabel(text: '${localization.grade} $characterGrade'),
    );
  }
}
