import 'package:flutter/widgets.dart';

class KKShadows {
  late final List<BoxShadow> cardShadow;

  KKShadows({required Color shadow}) {
    final shadow1 = shadow.withOpacity(0.5);

    cardShadow = [
      BoxShadow(
        color: shadow1,
        offset: const Offset(0, 4),
        blurRadius: 8,
      ),
    ];
  }
}
