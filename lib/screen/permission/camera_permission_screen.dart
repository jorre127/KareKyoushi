import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/screen/permission/base_permission_screen.dart';
import 'package:kare_kyoushi/styles/theme_assets.dart';
import 'package:kare_kyoushi/viewmodel/permission/camera_permission_viewmodel.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(returnType: bool)
class CameraPermissionScreen extends StatefulWidget {
  const CameraPermissionScreen({super.key});

  @override
  CameraPermissionScreenState createState() => CameraPermissionScreenState();
}

class CameraPermissionScreenState extends State<CameraPermissionScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CameraPermissionViewModel>(
      create: () => getIt(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BasePermissionScreen(
        image: ThemeAssets.analyticsImage(context),
        title: localization.cameraPermissionTitle,
        message: localization.cameraPermissionMessage,
        buttonText: localization.cameraPermissionAllow,
        onButtonTapped: viewModel.onAllowCameraPermissionTapped,
      ),
    );
  }
}
