import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/viewmodel/character_list/characters_mixin.dart';

@injectable
class CharacterDetailListViewmodel extends ChangeNotifierEx with CharactersMixin {
  final CharacterRepository _characterRepository;
  final _pageController = PageController();

  late Character _initialCharacter;

  bool _initialCharacterHasBeenSet = false;

  PageController get pageController => _pageController;

  Character get currentCharacter => characters.isEmpty ? _initialCharacter : characters[currentPage ?? 0];

  int? get currentPage => pageController.hasClients ? pageController.page?.toInt() : 0;

  CharacterDetailListViewmodel(this._characterRepository);

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
    _pageController.addListener(() {
      if (disposed) return;
      notifyListeners();
    });
  }

  @override
  void oncharacterUpdated(List<Character> character) {
    if (_initialCharacterHasBeenSet) return;
    _initialCharacterHasBeenSet = true;
    final index = characters.indexWhere((element) => element.value == _initialCharacter.value);
    _pageController.animateToPage(
      index,
      duration: const Duration(microseconds: 1),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }

  void onPageChanged(int index) {
    if (disposed) return;
    notifyListeners();
  }

  void onMehTapped() => _updateCharacter(KnowledgeLevel.meh);

  void onGotItTapped() => _updateCharacter(KnowledgeLevel.gotIt);

  Future<void> _updateCharacter(KnowledgeLevel level) async {
    KnowledgeLevel? newLevel = level;
    if (currentCharacter.knowledgeLevel == level) {
      newLevel = null;
    }
    await _characterRepository.updateKnowledgeLevelForCharacter(
      level: newLevel,
      character: currentCharacter.value,
    );
    await _getCharacter();
    if (disposed) return;
    notifyListeners();
  }

  Future<void> _getCharacter() async => characters[characters.indexOf(currentCharacter)] = await _characterRepository.getCharacter(currentCharacter.value);
}
