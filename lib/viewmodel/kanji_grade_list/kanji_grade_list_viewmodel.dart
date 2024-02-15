import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@injectable
class KanjiGradeListViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final KanjiRepository _kanjiRepository;

  final _kanjiCountMap = <Jlpt, int>{};

  Map<Jlpt, int> get kanjiCountMap => _kanjiCountMap;

  KanjiGradeListViewModel(
    this._navigator,
    this._kanjiRepository,
  );

  Future<void> init() async {
    await _initKanji();
  }

  Future<void> _initKanji() async {
    for (final jlpt in Jlpt.values) {
      final length = (await _kanjiRepository.getKanjiForLevel(jlpt.rank)).length;
      kanjiCountMap[jlpt] = length;
    }
    if (disposed) return;
    notifyListeners();
  }

  Future<void> onGradeTapped(Jlpt jlpt) => _navigator.goToKanjiListScreen(jlpt: jlpt);
}
