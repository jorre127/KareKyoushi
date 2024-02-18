import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';

@injectable
class CharacterListViewModel with ChangeNotifierEx {
  late DifficultyGrade _difficultyGrade;

  final MainNavigator _navigator;
  final CharacterRepository _characterRepository;

  final _characters = <Character>[];

  DifficultyGrade get difficultyGrade => _difficultyGrade;

  List<Character> get characters => _characters;

  CharacterListViewModel(
    this._navigator,
    this._characterRepository,
  );

  Future<void> init(DifficultyGrade difficultyGrade) async {
    _difficultyGrade = difficultyGrade;
    registerDisposeStream(_characterRepository.getCharacterForLevelStream(difficultyGrade.rank).listen(_oncharacterUpdated));
  }

  Future<void> _oncharacterUpdated(List<Character> character) async {
    _characters.replaceAll((character)..sortBy((item) => item.frequency ?? 999));
    if (disposed) return;
    notifyListeners();
  }

  void onCharacterTapped(Character character) {
    HapticFeedback.mediumImpact();
    _navigator.goToCharacterDetailScreen(character: character.value);
  }
}
