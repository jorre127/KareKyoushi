import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/general/kanji/label.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGradeLabel extends StatelessWidget {
  final int kanjiGrade;

  const KanjiGradeLabel({
    required this.kanjiGrade,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => KKLabel(text: '${localization.grade} $kanjiGrade'),
    );
  }
}
