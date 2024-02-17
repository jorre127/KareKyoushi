import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kanji/kanji_dao_storage.dart';
import 'package:kare_kyoushi/model/enum/jlpt.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/viewmodel/kanji_grade_list/kanji_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/webservice/kanji/kanji_service.dart';

@lazySingleton
abstract class KanjiRepository {
  @factoryMethod
  factory KanjiRepository(KanjiDaoStorage kanjiDaoStorage, KanjiService kanjiService) = _KanjiRepository;

  Future<void> initKanji();

  Stream<List<Kanji>> getKanjiForLevelStream(int level);

  Future<Kanji> getKanji(String kanji);

  Stream<Map<Jlpt, KanjiProgress>> getKanjiProgressStream();

  Future<void> updateKnowledgeLevelForKanji({
    required KnowledgeLevel? level,
    required String kanji,
  });
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
    final hasBeenIntialised = await _kanjiDaoStorage.hasData();
    if (hasBeenIntialised) return;
    final kanji = await _kanjiService.getKanji();
    await _kanjiDaoStorage.initKanji(kanji);
  }

  @override
  Stream<List<Kanji>> getKanjiForLevelStream(int level) => _kanjiDaoStorage.getKanjiForLevelStream(level);

  @override
  Future<void> updateKnowledgeLevelForKanji({
    required KnowledgeLevel? level,
    required String kanji,
  }) =>
      _kanjiDaoStorage.updateKnowledgeLevelForKanji(
        level: level,
        kanji: kanji,
      );

  @override
  Future<Kanji> getKanji(String kanji) => _kanjiDaoStorage.getKanji(kanji);

  @override
  Stream<Map<Jlpt, KanjiProgress>> getKanjiProgressStream() => _kanjiDaoStorage.getKanjiStream().map(
        (event) {
          final kanjiProgressMap = <Jlpt, KanjiProgress>{};
          final sortedKanji = event.groupListsBy((item) => item.jlpt?.rank);
          for (final level in sortedKanji.keys.toList().reversed) {
            final kanji = sortedKanji[level];
            if (level == null || kanji == null) continue;
            final jlptLevel = Jlpt.values.firstWhere((kanji) => kanji.rank == level);
            kanjiProgressMap[jlptLevel] = KanjiProgress(
              jlpt: jlptLevel,
              totalKanji: kanji.length,
              mehKanji: kanji.where((kanji) => kanji.knowledgeLevel == KnowledgeLevel.meh).length,
              gotItKanji: kanji.where((kanji) => kanji.knowledgeLevel == KnowledgeLevel.gotIt).length,
            );
          }
          return kanjiProgressMap;
        },
      );
}
