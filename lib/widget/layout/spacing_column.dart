import 'package:flutter/material.dart';
import 'package:kare_kyoushi/widget/layout/spacing_flex.dart';

class SpacingColumn extends SpacingFlex {
  const SpacingColumn({
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.crossAxisAlignment,
    super.textDirection,
    super.verticalDirection,
    super.textBaseline,
    super.children,
    super.spacing,
  }) : super(
          direction: Axis.vertical,
        );
}
