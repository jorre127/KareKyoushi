import 'dart:async';

import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';
import 'package:kare_kyoushi/viewmodel/kanji_grade_list/kanji_grade_list_viewmodel.dart';

@injectable
class HomeViewModel with ChangeNotifierEx {
  // ignore: unused_field
  final MainNavigator _navigator;
  final KanjiRepository _kanjiRepository;

  final _kanjiProgress = <KanjiProgress>[];

  List<KanjiProgress> get kanjiProgress => _kanjiProgress;

  HomeViewModel(
    this._navigator,
    this._kanjiRepository,
  );

  Future<void> init() async {
    registerDisposeStream(_kanjiRepository.getKanjiProgressStream().listen(_onKanjiProgressUpdated));
  }

  Future<void> _onKanjiProgressUpdated(Map<Jlpt, KanjiProgress> progress) async {
    _kanjiProgress.replaceAll(progress.values);
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onAlphabetTapped(Alphbabet alphbabet) async {
    unawaited(HapticFeedback.mediumImpact());
    return switch (alphbabet) {
      Alphbabet.hiragana => null,
      Alphbabet.katakana => null,
      Alphbabet.kanji => _navigator.goToKanjiGradeListScreen(),
    };
  }
}
