import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/viewmodel/character_list/characters_mixin.dart';

@injectable
class CharacterDetailListViewmodel extends ChangeNotifierEx with CharactersMixin {
  final _pageController = PageController();

  late Character _initialCharacter;

  bool _initialCharacterHasBeenSet = false;

  PageController get pageController => _pageController;

  void init(
    DifficultyGrade difficultyGrade,
    Alphabet alphabet,
    Character character,
  ) {
    _initialCharacter = character;
    initCharacters(
      difficultyGrade: difficultyGrade,
      alphabet: alphabet,
    );
  }

  @override
  void oncharacterUpdated(List<Character> character) {
    if (_initialCharacterHasBeenSet) return;
    _initialCharacterHasBeenSet = true;
    final index = characters.indexWhere((element) => element.value == _initialCharacter.value);
    _pageController.jumpToPage(index);
  }
}
