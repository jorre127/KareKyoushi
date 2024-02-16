import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/word/word_dao_storage.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/webservice/word/word_service.dart';

@lazySingleton
abstract class WordRepository {
  @factoryMethod
  factory WordRepository(WordService service, WordDaoStorage wordDaoStorage) = _WordRepository;

  Future<void> initWords();

  Future<List<Word>> getWordsContaining(String kanji);
}

class _WordRepository implements WordRepository {
  final WordService _service;
  final WordDaoStorage _wordDaoStorage;

  _WordRepository(
    this._service,
    this._wordDaoStorage,
  );

  @override
  Future<void> initWords() async {
    final hasBeenIntialised = await _wordDaoStorage.hasData();
    if (hasBeenIntialised) return;
    final words = await _service.getWords();
    await _wordDaoStorage.initWords(words);
  }

  @override
  Future<List<Word>> getWordsContaining(String kanji) => _wordDaoStorage.getWordsContaining(kanji);
}
