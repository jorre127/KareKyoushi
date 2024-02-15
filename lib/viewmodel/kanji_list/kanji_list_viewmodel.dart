import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@injectable
class KanjiListViewModel with ChangeNotifierEx {
  late Jlpt _jlpt;
  final KanjiRepository _kanjiRepository;

  final MainNavigator _navigator;

  final _kanji = <Kanji>[];

  Jlpt get jlpt => _jlpt;

  List<Kanji> get kanji => _kanji;

  KanjiListViewModel(
    this._navigator,
    this._kanjiRepository,
  );

  Future<void> init(Jlpt jlpt) async {
    _jlpt = jlpt;
    await _getKanji();
  }

  Future<void> _getKanji() async {
    _kanji.replaceAll(await _kanjiRepository.getKanjiForLevel(_jlpt.rank));
    if (disposed) return;
    notifyListeners();
  }
}
