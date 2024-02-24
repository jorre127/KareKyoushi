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
      childBuilderTheme: (context, theme) => SizedBox(
        height: size + 12,
        width: size + 12,
        child: OverflowBox(
          maxHeight: size * 1.5,
          maxWidth: size * 1.5,
          child: TouchFeedBack(
            borderRadius: BorderRadius.circular(48),
            onClick: onClick,
            child: Center(
              child: SvgIcon(
                svgAsset: svgAsset,
                size: size,
                color: color ?? theme.colorsTheme.icon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
