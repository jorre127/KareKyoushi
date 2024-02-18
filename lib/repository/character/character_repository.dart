import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/character/character_dao_storage.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/webservice/character/character_service.dart';

@lazySingleton
abstract class CharacterRepository {
  @factoryMethod
  factory CharacterRepository(CharacterDaoStorage characterDaoStorage, CharacterService characterService) = _CharacterRepository;

  Future<void> initCharacters();

  Stream<List<Character>> getCharacterForLevelStream(int level);

  Future<Character> getCharacter(String character);

  Stream<Map<DifficultyGrade, CharacterProgress>> getCharacterProgressStream();

  Future<void> updateKnowledgeLevelForCharacter({
    required KnowledgeLevel? level,
    required String character,
  });
}

class _CharacterRepository implements CharacterRepository {
  final CharacterDaoStorage _characterDaoStorage;
  final CharacterService _characterService;

  _CharacterRepository(
    this._characterDaoStorage,
    this._characterService,
  );

  @override
  Future<void> initCharacters() async {
    final hasBeenIntialised = await _characterDaoStorage.hasData();
    if (hasBeenIntialised) return;
    final character = await _characterService.getCharacters();
    await _characterDaoStorage.initCharacters(character);
  }

  @override
  Stream<List<Character>> getCharacterForLevelStream(int level) => _characterDaoStorage.getCharacterForLevelStream(level);

  @override
  Future<void> updateKnowledgeLevelForCharacter({
    required KnowledgeLevel? level,
    required String character,
  }) =>
      _characterDaoStorage.updateKnowledgeLevelForCharacter(
        level: level,
        character: character,
      );

  @override
  Future<Character> getCharacter(String character) => _characterDaoStorage.getCharacter(character);

  @override
  Stream<Map<DifficultyGrade, CharacterProgress>> getCharacterProgressStream() => _characterDaoStorage.getCharacterStream().map(
        (event) {
          final characterProgressMap = <DifficultyGrade, CharacterProgress>{};
          final sortedCharacter = event.groupListsBy((item) => item.difficultyGrade?.rank);
          for (final level in sortedCharacter.keys.toList().reversed) {
            final character = sortedCharacter[level];
            if (level == null || character == null) continue;
            final difficultyGradeLevel = DifficultyGrade.values.firstWhere((character) => character.rank == level);
            characterProgressMap[difficultyGradeLevel] = CharacterProgress(
              difficultyGrade: difficultyGradeLevel,
              totalCharacter: character.length,
              mehCharacter: character.where((character) => character.knowledgeLevel == KnowledgeLevel.meh).length,
              gotItCharacter: character.where((character) => character.knowledgeLevel == KnowledgeLevel.gotIt).length,
            );
          }
          return characterProgressMap;
        },
      );
}
