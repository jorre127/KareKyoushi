import 'package:flutter/material.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

enum JlptTagStyle { normal, simple }

@immutable
class JlptTagdata {
  final Color backgroundColor;
  final Color? textColor;

  const JlptTagdata({
    required this.backgroundColor,
    this.textColor,
  });
}

class JlptLabel extends StatelessWidget {
  final Jlpt jlptLevel;
  final JlptTagStyle style;

  const JlptLabel({
    required this.jlptLevel,
    this.style = JlptTagStyle.normal,
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
            localization.getTranslation(jlptLevel.titleKey),
            style: theme.textThemes.coreTextTheme.titleSubHeader.copyWith(
              fontWeight: FontWeight.w700,
              color: data.textColor,
            ),
          ),
        );
      },
    );
  }

  JlptTagdata _getData() => switch (style) {
        JlptTagStyle.normal => JlptTagdata(
            backgroundColor: jlptLevel.color,
            textColor: null,
          ),
        JlptTagStyle.simple => JlptTagdata(
            backgroundColor: Colors.transparent,
            textColor: jlptLevel.color,
          ),
      };
}
