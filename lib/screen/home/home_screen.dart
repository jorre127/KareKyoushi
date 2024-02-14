import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => const BaseScreen(
        children: [],
      ),
    );
  }
}
