import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKProgressBar extends StatelessWidget {
  final int progress1;
  final int? progress2;
  final int totalProgress;
  final Color progress1Color;
  final Color? progress2Color;

  const KKProgressBar({
    required this.progress1,
    required this.progress2,
    required this.progress1Color,
    required this.progress2Color,
    required this.totalProgress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => LayoutBuilder(
        builder: (context, constraints) {
          final progress1Width = progress1 == 0 ? 0.0 : (progress1 / totalProgress) * constraints.maxWidth;
          double? progress2Width;
          if (progress2 != null) {
            progress2Width = progress2 == 0 ? 0.0 : ((progress2! / totalProgress) * constraints.maxWidth) + progress1Width;
          }

          return Stack(
            children: [
              AnimatedContainer(
                duration: ThemeDurations.shortAnimationDuration,
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorsTheme.stroke,
                  borderRadius: ThemeDimens.progressBorderRadius,
                ),
              ),
              if (progress2 != null) ...[
                AnimatedContainer(
                  duration: ThemeDurations.shortAnimationDuration,
                  height: 4,
                  width: progress2Width!,
                  decoration: BoxDecoration(
                    color: progress2Color,
                    borderRadius: ThemeDimens.progressBorderRadius,
                  ),
                ),
              ],
              AnimatedContainer(
                duration: ThemeDurations.shortAnimationDuration,
                height: 4,
                width: progress1Width,
                decoration: BoxDecoration(
                  color: progress1Color,
                  borderRadius: ThemeDimens.progressBorderRadius,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
