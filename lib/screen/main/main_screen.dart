import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/model/bottom_navigation/bottom_navigation_tab.dart';

@FlutterRoute(
  navigationType: NavigationType.pushAndReplaceAll,
)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  var _currentTab = BottomNavigationTab.defaultTab;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationTab.home.childBuilder(context);
  }

  // ignore: unused_element
  void _onItemTapped(BottomNavigationTab tab) {
    if (tab == _currentTab) return;
    setState(() => _currentTab = tab);
  }
}
