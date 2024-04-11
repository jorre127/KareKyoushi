import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKCard extends StatelessWidget {
  final VoidCallback? onTapped;
  final BorderRadius? borderRadius;
  final EdgeInsets? padding;
  final Widget? child;
  final Color? color;

  const KKCard({
    required this.child,
    this.borderRadius,
    this.color,
    this.onTapped,
    this.padding = const EdgeInsets.all(24),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedBack(
        onTapped: onTapped,
        borderRadius: borderRadius ?? ThemeDimens.cardBorderRadius,
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            color: color ?? theme.colorsTheme.bgCard,
            borderRadius: borderRadius ?? ThemeDimens.cardBorderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
