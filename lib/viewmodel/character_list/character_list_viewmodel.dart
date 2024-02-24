import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/viewmodel/character_list/characters_mixin.dart';

@injectable
class CharacterListViewModel extends ChangeNotifierEx with CharactersMixin {
  final MainNavigator _navigator;

  CharacterListViewModel(
    this._navigator,
  );

  Future<void> init(DifficultyGrade difficultyGrade, Alphabet alphabet) async {
    initCharacters(difficultyGrade: difficultyGrade, alphabet: alphabet);
  }

  void onCharacterTapped(Character character) {
    HapticFeedback.mediumImpact();
    _navigator.goToCharacterDetailListScreen(
      difficultyGrade: difficultyGrade,
      alphabet: alphabet,
      character: character,
    );
  }
}
