import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@immutable
class KanjiProgress {
  final Jlpt jlpt;
  final int totalKanji;
  final int mehKanji;
  final int gotItKanji;

  const KanjiProgress({
    required this.jlpt,
    required this.totalKanji,
    required this.mehKanji,
    required this.gotItKanji,
  });
}

@injectable
class KanjiGradeListViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final KanjiRepository _kanjiRepository;

  var _kanjiProgressMap = <Jlpt, KanjiProgress>{};

  Map<Jlpt, KanjiProgress> get kanjiProgressMap => _kanjiProgressMap;

  KanjiGradeListViewModel(
    this._navigator,
    this._kanjiRepository,
  );

  Future<void> init() async {
    registerDisposeStream(_kanjiRepository.getKanjiProgressStream().listen(_onKanjiProgressUpdated));
  }

  Future<void> _onKanjiProgressUpdated(Map<Jlpt, KanjiProgress> progress) async {
    _kanjiProgressMap = progress;
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onGradeTapped(Jlpt jlpt) {
    HapticFeedback.mediumImpact();
    return _navigator.goToKanjiListScreen(jlpt: jlpt);
  }
}
