import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Gap extends LeafRenderObjectWidget {
  final double gap;

  const Gap(this.gap, {super.key});

  @override
  RenderObject createRenderObject(BuildContext context) => RenderGap(gap);

  @override
  void updateRenderObject(BuildContext context, RenderGap renderObject) => renderObject.updateGapValue(gap);
}

class RenderGap extends RenderBox {
  double _gap;

  double get gap => _gap;

  RenderGap(this._gap);

  void updateGapValue(double value) {
    if (value == gap) return;
    _gap = value;
    performLayout();
  }

  @override
  void performLayout() {
    final gapParent = parent;
    if (gapParent is RenderFlex) {
      final width = gapParent.direction == Axis.horizontal ? _gap : 0.0;
      final height = gapParent.direction == Axis.vertical ? _gap : 0.0;
      size = constraints.constrain(Size(width, height));
    } else {
      throw FlutterError('A gap widget must be placed directly inside a Flex widget');
    }
  }
}
