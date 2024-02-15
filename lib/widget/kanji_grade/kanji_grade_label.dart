import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KanjiGradeLabel extends StatelessWidget {
  final Jlpt jlptLevel;

  const KanjiGradeLabel({
    required this.jlptLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: jlptLevel.color,
            borderRadius: ThemeDimens.tagBorderRadius,
          ),
          child: Text(
            localization.getTranslation(jlptLevel.titleKey),
            style: theme.textThemes.coreTextTheme.titleSubHeader.copyWith(fontWeight: FontWeight.w700),
          ),
        );
      },
    );
  }
}
