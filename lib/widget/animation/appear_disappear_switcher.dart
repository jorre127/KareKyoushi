import 'package:flutter/material.dart';
import 'package:kare_kyoushi/styles/theme_durations.dart';

class AppearDisappearSwitcher extends StatelessWidget {
  final bool isVisible;
  final bool fillWidth;
  final Widget child;
  final Alignment alignment;

  const AppearDisappearSwitcher({
    required this.child,
    required this.isVisible,
    this.fillWidth = true,
    this.alignment = Alignment.topCenter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: child,
      alignment: alignment,
      secondChild: fillWidth ? Container() : const SizedBox.shrink(),
      crossFadeState: isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: ThemeDurations.shortAnimationDuration,
    );
  }
}
