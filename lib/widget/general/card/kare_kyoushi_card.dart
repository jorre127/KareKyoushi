import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_dimens.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class KKCard extends StatelessWidget {
  final VoidCallback? onTapped;
  final EdgeInsets? padding;
  final Widget? child;

  const KKCard({
    required this.onTapped,
    required this.child,
    this.padding = const EdgeInsets.all(24),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => TouchFeedBack(
        onClick: onTapped,
        borderRadius: ThemeDimens.cardBorderRadius,
        child: Container(
          width: double.infinity,
          padding: padding,
          decoration: BoxDecoration(
            color: theme.colorsTheme.bgCard,
            borderRadius: ThemeDimens.cardBorderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}
