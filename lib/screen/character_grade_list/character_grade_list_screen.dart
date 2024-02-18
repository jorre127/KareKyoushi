import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/character_grade/character_grade_list_item.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class CharacterGradeListScreen extends StatefulWidget {
  const CharacterGradeListScreen({super.key});

  @override
  CharacterGradeListScreenState createState() => CharacterGradeListScreenState();
}

class CharacterGradeListScreenState extends State<CharacterGradeListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CharacterGradeListViewModel>(
      create: () => getIt()..init(),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen(
        title: localization.kanjiGradeListScreenTitle,
        showHeader: true,
        children: DifficultyGrade.values
            .map(
              (difficultyGrade) => Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CharacterGradeListItem(
                  difficultyGrade: difficultyGrade,
                  total: viewModel.characterProgressMap[difficultyGrade]?.totalCharacter ?? 0,
                  current1: viewModel.characterProgressMap[difficultyGrade]?.gotItCharacter?? 0,
                  current2: viewModel.characterProgressMap[difficultyGrade]?.mehCharacter ?? 0,
                  onTapped: () => viewModel.onGradeTapped(difficultyGrade),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
