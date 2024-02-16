import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/layout/spacing_flex.dart';

class SpacingRow extends SpacingFlex {
  const SpacingRow({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
    super.spacing,
    super.separatorBuilder,
  }) : super(
          direction: Axis.horizontal,
        );
}
