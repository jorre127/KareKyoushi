import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

class SpacingWrap extends StatelessWidget {
  final Axis direction;
  final double spacing;
  final List<Widget> children;
  final WidgetBuilder? separatorBuilder;

  const SpacingWrap({
    required this.children,
    this.spacing = 16,
    this.direction = Axis.horizontal,
    this.separatorBuilder,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: children
          .mapIndexed(
            (index, child) {
              final isLast = index == children.length - 1;
              final isHorizontal = direction == Axis.horizontal;
              final isEmptySizedBox = child is SizedBox && child.child == null;

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
