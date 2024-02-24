import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/general/svg_icon.dart';
import 'package:kare_kyoushi/widget/provider/data_provider_widget.dart';

class ActionItem extends StatelessWidget {
  final String svgAsset;
  final VoidCallback? onClick;
  final Color? color;
  final double size;

  const ActionItem({
    required this.svgAsset,
    required this.onClick,
    required this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TouchFeedBack(
        borderRadius: BorderRadius.circular(48),
        onClick: onClick,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgIcon(
              svgAsset: svgAsset,
              size: size,
              color: color ?? theme.colorsTheme.icon,
            ),
          ),
        ),
      ),
    );
  }
}
