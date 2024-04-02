import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/widget/layout/gap.dart';

class SpacingFlex extends StatelessWidget {
  final Clip clipBehavior;
  final Axis direction;
  final double spacing;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final TextBaseline? textBaseline;
  final TextDirection? textDirection;
  final WidgetBuilder? separatorBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final VerticalDirection verticalDirection;

  const SpacingFlex({
    required this.direction,
    this.spacing = 16,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.clipBehavior = Clip.none,
    this.children = const [],
    this.separatorBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: direction,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      clipBehavior: clipBehavior,
      children: children
          .mapIndexed(
            (index, child) {
              final isLast = index == children.length - 1;
              final isHorizontal = direction == Axis.horizontal;
              final isEmptySizedBox = (child is SizedBox && child.child == null) || child is Gap;

              return [
                child,
                if (!isLast) ...[
                  if (!isEmptySizedBox) ...[
                    SizedBox(
                      width: isHorizontal ? spacing : 0,
                      height: !isHorizontal ? spacing : 0,
                    ),
                  ],
                  if (separatorBuilder != null) ...[
                    separatorBuilder!(context),
                    SizedBox(
                      width: isHorizontal ? spacing : 0,
                      height: !isHorizontal ? spacing : 0,
                    ),
                  ]
                ],
              ];
            },
          )
          .expand((element) => element)
          .toList(),
    );
  }
}
