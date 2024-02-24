import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/character/character_dao_storage.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/util/extension/list_extension.dart';
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart';
import 'package:kare_kyoushi/webservice/character/character_service.dart';

@lazySingleton
abstract class CharacterRepository {
  @factoryMethod
  factory CharacterRepository(CharacterDaoStorage characterDaoStorage, CharacterService characterService) = _CharacterRepository;

  Future<void> initCharacters();

  Stream<List<Character>> getCharacterForLevelStream({required DifficultyGrade level, required Alphabet alphabet});

  Future<Character> getCharacter(String character);

  Stream<Map<Alphabet, List<CharacterProgress>>> getCharacterProgressStream();

  Stream<List<CharacterProgress>> getCharacterProgressForAlphabetStream({required Alphabet alphabet});

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
  Stream<List<Character>> getCharacterForLevelStream({
    required DifficultyGrade level,
    required Alphabet alphabet,
  }) =>
      _characterDaoStorage
          .getCharacterForLevelStream(
            level: level,
            alphabet: alphabet,
          )
          .map((characters) => alphabet == Alphabet.kanji ? (characters..sortByX([(character) => character.frequency ?? 999])) : characters);

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
  Stream<Map<Alphabet, List<CharacterProgress>>> getCharacterProgressStream() => _characterDaoStorage.getCharacterStream().map(
        (characters) {
          final progressMap = <Alphabet, List<CharacterProgress>>{};
          for (final alphabet in Alphabet.values) {
            progressMap[alphabet] = _getProgressForCharacters(characters.where((character) => character.alphbabet == alphabet).toList());
          }
          return progressMap;
        },
      );

  List<CharacterProgress> _getProgressForCharacters(List<Character> characters) {
    final characterProgressList = <CharacterProgress>[];
    final sortedCharacter = characters.groupListsBy((item) => item.difficultyGrade.rank);
    for (final level in sortedCharacter.keys.toList().reversed) {
      final character = sortedCharacter[level];
      if (character == null) continue;
      final difficultyGradeLevel = DifficultyGrade.values.firstWhere((character) => character.rank == level);
      characterProgressList.add(
        CharacterProgress(
          difficultyGrade: difficultyGradeLevel,
          totalCharacter: character.length,
          mehCharacter: character.where((character) => character.knowledgeLevel == KnowledgeLevel.meh).length,
          gotItCharacter: character.where((character) => character.knowledgeLevel == KnowledgeLevel.gotIt).length,
        ),
      );
    }
    return characterProgressList..sort((a, b) => b.difficultyGrade.rank.compareTo(a.difficultyGrade.rank));
  }

  @override
  Stream<List<CharacterProgress>> getCharacterProgressForAlphabetStream({required Alphabet alphabet}) => getCharacterProgressStream().map((event) => event[alphabet]!);
}
