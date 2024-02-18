import 'dart:async';

import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';

@injectable
class HomeViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final CharacterRepository _characterRepository;

  var _characterProgress = <Alphabet, List<CharacterProgress>>{};

  Map<Alphabet, List<CharacterProgress>> get characterProgress => _characterProgress;

  HomeViewModel(
    this._navigator,
    this._characterRepository,
  );

  Future<void> init() async {
    registerDisposeStream(_characterRepository.getCharacterProgressStream().listen(_onCharacterProgressUpdated));
  }

  Future<void> _onCharacterProgressUpdated(Map<Alphabet, List<CharacterProgress>> progress) async {
    _characterProgress = progress;
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onAlphabetTapped(Alphabet alphabet) async {
    unawaited(HapticFeedback.mediumImpact());
    await _navigator.goToCharacterGradeListScreen(alphabet: alphabet);
  }
}
