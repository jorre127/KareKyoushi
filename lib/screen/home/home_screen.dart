import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/home/home_header.dart';
import 'package:kare_kyoushi/widget/home/home_list_item.dart';
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
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        customHeader: HomeHeader(
          userName: viewModel.userName,
          userPhoto: viewModel.userPhoto,
          onTapped: viewModel.onProfileTapped,
          userColor: viewModel.userColor,
        ),
        isScrollable: true,
        hasBottomSafeSpace: false,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              localization.homeSectionStudySubject,
              style: theme.textThemes.coreTextTheme.titleSubHeader,
            ),
          ),
          const SizedBox(height: 20),
          ...Alphabet.values.map(
            (alphabet) => Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: HomeListItem(
                title: localization.getTranslation(alphabet.titleKey),
                subTitle: localization.getTranslation(alphabet.titleJpKey),
                color: alphabet.color,
                onTapped: () => viewModel.onAlphabetTapped(alphabet),
                progress: viewModel.characterProgress[alphabet],
              ),
            ),
          ),
          HomeListItem(
            title: localization.homeSectionItemSavedWords,
            subTitle: localization.homeSectionItemSavedWordJp,
            color: theme.colorsTheme.accent2,
          ),
        ],
      ),
    );
  }
}
