import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/profile/profile_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/profile/profile_header.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ProfileViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        customHeader: ProfileHeader(
          userName: viewModel.userName,
          userPhoto: viewModel.userPhoto,
          onBackTapped: viewModel.onBackTapped,
          onEditTapped: viewModel.onEditTapped,
        ),
        children: const [],
      ),
    );
  }
}
