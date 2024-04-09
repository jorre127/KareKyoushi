import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/screen/permission/base_permission_screen.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/viewmodel/permission/library_permission_viewmodel.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(returnType: bool)
class LibraryPermissionScreen extends StatefulWidget {
  const LibraryPermissionScreen({super.key});

  @override
  LibraryPermissionScreenState createState() => LibraryPermissionScreenState();
}

class LibraryPermissionScreenState extends State<LibraryPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<LibraryPermissionViewModel>(
      create: () => getIt(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BasePermissionScreen(
        image: ThemeAssets.analyticsImage(context),
        title: localization.libraryPermissionTitle,
        message: localization.libraryPermissionMessage,
        buttonText: localization.libraryPermissionAllow,
        onButtonTapped: viewModel.onAllowLibraryPermissionTapped,
      ),
    );
  }
}
