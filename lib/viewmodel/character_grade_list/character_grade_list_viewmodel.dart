import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';

@immutable
class CharacterProgress {
  final DifficultyGrade difficultyGrade;
  final int totalCharacter;
  final int mehCharacter;
  final int gotItCharacter;

  const CharacterProgress({
    required this.difficultyGrade,
    required this.totalCharacter,
    required this.mehCharacter,
    required this.gotItCharacter,
  });
}

@injectable
class CharacterGradeListViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final CharacterRepository _characterRepository;

  var _characterProgressMap = <DifficultyGrade, CharacterProgress>{};

  Map<DifficultyGrade, CharacterProgress> get characterProgressMap => _characterProgressMap;

  CharacterGradeListViewModel(
    this._navigator,
    this._characterRepository,
  );

  Future<void> init() async {
    registerDisposeStream(_characterRepository.getCharacterProgressStream().listen(_onCharacterProgressUpdated));
  }

  Future<void> _onCharacterProgressUpdated(Map<DifficultyGrade, CharacterProgress> progress) async {
    _characterProgressMap = progress;
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onGradeTapped(DifficultyGrade difficultyGrade) {
    HapticFeedback.mediumImpact();
    return _navigator.goToCharacterListScreen(difficultyGrade: difficultyGrade);
  }
}
