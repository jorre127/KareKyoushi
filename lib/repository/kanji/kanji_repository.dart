import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kanji/kanji_dao_storage.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/webservice/kanji/kanji_service.dart';

@lazySingleton
abstract class KanjiRepository {
  @factoryMethod
  factory KanjiRepository(KanjiDaoStorage kanjiDaoStorage, KanjiService kanjiService) = _KanjiRepository;

  Future<void> initKanji();

  Future<List<Kanji>> getKanjiForLevel(int level);
}

class _KanjiRepository implements KanjiRepository {
  final KanjiDaoStorage _kanjiDaoStorage;
  final KanjiService _kanjiService;

  _KanjiRepository(
    this._kanjiDaoStorage,
    this._kanjiService,
  );

  @override
  Future<void> initKanji() async {
    final kanji = await _kanjiService.getKanji();
    await _kanjiDaoStorage.initKanji(kanji);
  }

  @override
  Future<List<Kanji>> getKanjiForLevel(int level) => _kanjiDaoStorage.getKanjiForLevel(level);
}
