import 'package:flutter/material.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/base_screen/base_screen.dart';
import 'package:kare_kyoushi/widget/general/character/difficulty_grade_label.dart';
import 'package:kare_kyoushi/widget/character_list/character_grid.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class CharacterListScreen extends StatefulWidget {
  final DifficultyGrade difficultyGrade;

  const CharacterListScreen({
    required this.difficultyGrade,
    super.key,
  });

  @override
  CharacterListScreenState createState() => CharacterListScreenState();
}

class CharacterListScreenState extends State<CharacterListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CharacterListViewModel>(
      create: () => getIt()..init(widget.difficultyGrade),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => BaseScreen.child(
        showHeader: true,
        padding: EdgeInsets.zero,
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DifficultyGradeLabel(difficultyGrade: viewModel.difficultyGrade),
            const SizedBox(width: 8),
            Text(
              localization.getTranslation(viewModel.difficultyGrade.difficultyKey),
              style: theme.textThemes.coreTextTheme.titleHeader,
            ),
          ],
        ),
        child: CharacterGrid(
          characters: viewModel.characters,
          onCharacterTapped: viewModel.onCharacterTapped,
        ),
      ),
    );
  }
}
