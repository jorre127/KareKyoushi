import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/word/word_dao_storage.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@injectable
class KanjiDetailViewModel with ChangeNotifierEx {
  late String _kanjiValue;

  Kanji? _kanji;

  final MainNavigator _navigator;
  final WordDaoStorage _wordDaoStorage;
  final KanjiRepository _kanjiRepository;

  final _wordsContaining = <Word>[];

  Kanji? get kanji => _kanji;

  List<Word> get wordsContaining => _wordsContaining;

  KanjiDetailViewModel(
    this._navigator,
    this._wordDaoStorage,
    this._kanjiRepository,
  );

  Future<void> init(String kanjiValue) async {
    _kanjiValue = kanjiValue;
    await _getKanji();
    await _initWordsContaining();
  }

  Future<void> _getKanji() async => _kanji = await _kanjiRepository.getKanji(_kanjiValue);

  Future<void> _initWordsContaining() async {
    final kanji = _kanji;
    if (kanji == null) return;
    final words = await _wordDaoStorage.getWordsContaining(kanji.kanjiValue);
    _wordsContaining
      ..replaceAll(words)
      ..sortBy((item) => item.priority ?? 999);
    if (disposed) return;
    notifyListeners();
  }

  Future<void> _updateKanji(KnowledgeLevel level) async {
    KnowledgeLevel? newLevel = level;
    if (kanji?.knowledgeLevel == level) {
      newLevel = null;
    }
    await _kanjiRepository.updateKnowledgeLevelForKanji(level: newLevel, kanji: _kanjiValue);
    await _getKanji();
    if (disposed) return;
    notifyListeners();
  }

  void onMehTapped() => _updateKanji(KnowledgeLevel.meh);

  void onGotItTapped() => _updateKanji(KnowledgeLevel.gotIt);

  void onCloseTapped() => _navigator.goBack();
}
