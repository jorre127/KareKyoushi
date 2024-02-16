import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';
import 'package:kare_kyoushi/repository/word/word_repository.dart';

@lazySingleton
class StartupHelper {
  final KanjiRepository _kanjiRepository;
  final WordRepository _wordRepository;

  StartupHelper(
    this._kanjiRepository,
    this._wordRepository,
  );

  Future<void> startup() async {
    await _kanjiRepository.initKanji();
    await _wordRepository.initWords();
  }
}
