import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/repository/word/word_repository.dart';

@lazySingleton
class StartupHelper {
  final CharacterRepository _characterRepository;
  final WordRepository _wordRepository;

  StartupHelper(
    this._characterRepository,
    this._wordRepository,
  );

  Future<void> startup() async {
    await _characterRepository.initCharacters();
    await _wordRepository.initWords();
  }
}
