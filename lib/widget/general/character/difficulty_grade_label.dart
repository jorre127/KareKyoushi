import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

enum DifficultyGradeTagStyle { normal, simple }

@immutable
class DifficultyGradeTagdata {
  final Color backgroundColor;
  final Color? textColor;

  const DifficultyGradeTagdata({
    required this.backgroundColor,
    this.textColor,
  });
}

class DifficultyGradeLabel extends StatelessWidget {
  final DifficultyGrade difficultyGrade;
  final DifficultyGradeTagStyle style;

  const DifficultyGradeLabel({
    required this.difficultyGrade,
    this.style = DifficultyGradeTagStyle.normal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final data = _getData();
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: data.backgroundColor,
            borderRadius: ThemeDimens.tagBorderRadius,
          ),
          child: Text(
            localization.getTranslation(difficultyGrade.titleKey),
            style: theme.textThemes.coreTextTheme.titleSubHeader.copyWith(
              fontWeight: FontWeight.w700,
              color: data.textColor,
            ),
          ),
        );
      },
    );
  }

  DifficultyGradeTagdata _getData() => switch (style) {
        DifficultyGradeTagStyle.normal => DifficultyGradeTagdata(
            backgroundColor: difficultyGrade.color,
            textColor: null,
          ),
        DifficultyGradeTagStyle.simple => DifficultyGradeTagdata(
            backgroundColor: Colors.transparent,
            textColor: difficultyGrade.color,
          ),
      };
}
