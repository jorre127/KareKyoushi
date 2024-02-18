import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/character_grade/character_grade_list_item.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class CharacterGradeListScreen extends StatefulWidget {
  final Alphabet alphabet;

  const CharacterGradeListScreen({
    required this.alphabet,
    super.key,
  });

  @override
  CharacterGradeListScreenState createState() => CharacterGradeListScreenState();
}

class CharacterGradeListScreenState extends State<CharacterGradeListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CharacterGradeListViewModel>(
      create: () => getIt()..init(widget.alphabet),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        title: localization.kanjiGradeListScreenTitle,
        showHeader: true,
        children:viewModel.alphabet.levels.map(
          (difficultyGrade) {
            final characterprogress = viewModel.characterProgress.firstWhereOrNull((progress) => progress.difficultyGrade == difficultyGrade);
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CharacterGradeListItem(
                difficultyGrade: difficultyGrade,
                total: characterprogress?.totalCharacter??0,
                current1: characterprogress?.gotItCharacter??0,
                current2: characterprogress?.mehCharacter??0,
                onTapped: () => viewModel.onGradeTapped(difficultyGrade),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
