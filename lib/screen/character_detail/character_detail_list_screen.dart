import 'package:flutter/widgets.dart';
import 'package:flutter_navigation_generator_annotations/flutter_navigation_generator_annotations.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/screen/character_detail/character_detail_screen.dart';
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart';
import 'package:kare_kyoushi/widget/character_detail/character_detail_buttons.dart';
import 'package:kare_kyoushi/widget/provider/provider_widget.dart';

@FlutterRoute(isFullscreenDialog: true)
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
      childBuilderWithViewModel: (context, viewModel, theme, localization) => Stack(
        children: [
          PageView.builder(
            controller: viewModel.pageController,
            itemCount: viewModel.characters.length,
            onPageChanged: viewModel.onPageChanged,
            itemBuilder: (context, index) {
              final character = viewModel.characters[index];
              return CharacterDetailScreen(
                characterValue: character.value,
                character: character,
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                left: 44,
                right: 44,
                bottom: MediaQuery.paddingOf(context).bottom,
              ),
              child: CharacterDetailButtons(
                onMehTapped: viewModel.onMehTapped,
                onGotItTapped: viewModel.onGotItTapped,
                character: viewModel.currentCharacter,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
