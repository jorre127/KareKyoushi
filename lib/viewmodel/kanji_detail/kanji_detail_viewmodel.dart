import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/word/word_dao_storage.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';

@injectable
class KanjiDetailViewModel with ChangeNotifierEx {
  late Kanji _kanji;

  final MainNavigator _navigator;
  final WordDaoStorage _wordDaoStorage;

  final _wordsContaining = <Word>[];

  Kanji get kanji => _kanji;

  List<Word> get wordsContaining => _wordsContaining;

  KanjiDetailViewModel(
    this._navigator,
    this._wordDaoStorage,
  );

  Future<void> init(Kanji kanji) async {
    _kanji = kanji;
    await _initWordsContaining();
  }

  Future<void> _initWordsContaining() async {
    final words = await _wordDaoStorage.getWordsContaining(_kanji.kanjiValue);
    _wordsContaining
      ..replaceAll(words)
      ..sortBy((item) => item.priority ?? 999);
    if (disposed) return;
    notifyListeners();
  }

  void onCloseTapped() => _navigator.goBack();
}
