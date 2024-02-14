import 'package:flutter/material.dart';
import 'package:kare_kyoushi/screen/debug/debug_screen.dart';
import 'package:kare_kyoushi/util/locale/localization_keys.dart';

enum BottomNavigationTab {
  todo(icon: Icons.list, labelKey: LocalizationKeys.todoTitle),
  settings(icon: Icons.settings, labelKey: LocalizationKeys.settingsTitle);

  final IconData icon;
  final String labelKey;

  const BottomNavigationTab({
    required this.icon,
    required this.labelKey,
  });

  static BottomNavigationTab get defaultTab => BottomNavigationTab.todo;
}

extension BottomNavigationExtension on BottomNavigationTab {
  Widget childBuilder(BuildContext context) => switch (this) {
        BottomNavigationTab.todo => const SizedBox.shrink(),
        BottomNavigationTab.settings => const DebugScreen(),
      };
}
