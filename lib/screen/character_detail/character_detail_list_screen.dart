import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/screen/character_detail/character_detail_screen.dart';
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@flutterRoute
class CharacterDetailListScreen extends StatefulWidget {
  final Character character;
  final Alphabet alphabet;
  final DifficultyGrade difficultyGrade;

  const CharacterDetailListScreen({
    required this.alphabet,
    required this.difficultyGrade,
    required this.character,
    super.key,
  });

  @override
  State<CharacterDetailListScreen> createState() => _CharacterDetailListScreenState();
}

class _CharacterDetailListScreenState extends State<CharacterDetailListScreen> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CharacterDetailListViewmodel>(
      create: () => getIt.get()
        ..init(
          widget.difficultyGrade,
          widget.alphabet,
          widget.character,
        ),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => PageView.builder(
        controller: viewModel.pageController,
        itemCount: viewModel.characters.length,
        itemBuilder: (context, index) {
          final character = viewModel.characters[index];
          return CharacterDetailScreen(
            characterValue: character.value,
            character: character,
          );
        },
      ),
    );
  }
}
