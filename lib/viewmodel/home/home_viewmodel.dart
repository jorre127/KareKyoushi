import 'dart:async';

import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';

@injectable
class HomeViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final CharacterRepository _characterRepository;

  final _characterProgress = <CharacterProgress>[];

  List<CharacterProgress> get characterProgress => _characterProgress;

  HomeViewModel(
    this._navigator,
    this._characterRepository,
  );

  Future<void> init() async {
    registerDisposeStream(_characterRepository.getCharacterProgressStream().listen(_onCharacterProgressUpdated));
  }

  Future<void> _onCharacterProgressUpdated(Map<DifficultyGrade, CharacterProgress> progress) async {
    _characterProgress.replaceAll(progress.values);
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onAlphabetTapped(Alphabet alphbabet) async {
    unawaited(HapticFeedback.mediumImpact());
    return switch (alphbabet) {
      Alphabet.hiragana => null,
      Alphabet.katakana => null,
      Alphabet.kanji => _navigator.goToCharacterGradeListScreen(),
    };
  }
}
