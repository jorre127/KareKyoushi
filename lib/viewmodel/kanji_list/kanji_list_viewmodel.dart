import 'package:flutter/services.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@injectable
class KanjiListViewModel with ChangeNotifierEx {
  late Jlpt _jlpt;

  final MainNavigator _navigator;
  final KanjiRepository _kanjiRepository;

  final _kanji = <Kanji>[];

  Jlpt get jlpt => _jlpt;

  List<Kanji> get kanji => _kanji;

  KanjiListViewModel(
    this._navigator,
    this._kanjiRepository,
  );

  Future<void> init(Jlpt jlpt) async {
    _jlpt = jlpt;
    registerDisposeStream(_kanjiRepository.getKanjiForLevelStream(_jlpt.rank).listen(_onkanjiUpdated));
  }

  Future<void> _onkanjiUpdated(List<Kanji> kanji) async {
    _kanji.replaceAll((kanji)..sortBy((item) => item.frequency));
    if (disposed) return;
    notifyListeners();
  }

  void onKanjiTapped(Kanji kanji) {
    HapticFeedback.mediumImpact();
    _navigator.goToKanjiDetailScreen(kanji: kanji.kanjiValue);
  }
}
