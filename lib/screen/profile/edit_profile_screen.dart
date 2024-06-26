import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/viewmodel/profile/edit_profile_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/edit_profile/edit_profile_picture_buttons.dart';
import 'package:kare_kyoushi/widget/edit_profile/initials_picker.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_button.dart';
import 'package:kare_kyoushi/widget/general/styled/kare_kyoushi_input_field.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<EditProfileViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        showHeader: true,
        showHeaderBackground: true,
        title: localization.editProfileTitle,
        children: [
          KKInputField(
            value: viewModel.userName,
            title: localization.editProfileUsernameLabel,
            onChanged: viewModel.onUserNameChanged,
          ),
          const SizedBox(height: 24),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              localization.editProfilePictureLabel,
              style: theme.textThemes.subtleTextTheme.copySubtle,
            ),
          ),
          const SizedBox(height: 4),
          EditProfilePictureButtons(
            selectedColor: viewModel.selectedColor,
            selectedImage: viewModel.selectedImage,
            initialImageUrl: viewModel.initialImageUrl,
            onCameraTapped: viewModel.onCameraTapped,
            onImageTapped: viewModel.onImageTapped,
            onInitialsTapped: viewModel.onInitialsTapped,
            userName: viewModel.userName,
            showInitialsOptions: viewModel.showInitialsOptions,
          ),
          if (viewModel.showInitialsOptions) ...[
            const SizedBox(height: 8),
            InitialsPicker(
              onColorTapped: viewModel.onColorTapped,
              userName: viewModel.userName,
              selectedColor: viewModel.selectedColor,
            ),
          ],
          const Spacer(),
          KKButton(
            text: localization.editProfileConfirm,
            onClick: viewModel.onConfirmTapped,
            isLoading: viewModel.isSaving,
          ),
        ],
      ),
    );
  }
}
