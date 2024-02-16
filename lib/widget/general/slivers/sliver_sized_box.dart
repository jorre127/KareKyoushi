import 'package:flutter/material.dart';

class SliverSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const SliverSizedBox({
    this.height,
    this.width,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
        child: child,
      ),
    );
  }
}
