import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  bool get isShowingKeyboard => MediaQuery.viewInsetsOf(this).bottom > 40;
}
