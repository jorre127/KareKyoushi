import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/repository/user/user_repository.dart';
import 'package:kare_kyoushi/repository/word/word_repository.dart';

@lazySingleton
class StartupHelper {
  final WordRepository _wordRepository;
  final UserRepository _userRepository;
  final CharacterRepository _characterRepository;

  StartupHelper(
    this._characterRepository,
    this._wordRepository,
    this._userRepository,
  );

  Future<void> startup() async {
    await _characterRepository.initCharacters();
    await _wordRepository.initWords();
    await _userRepository.refreshUser();
  }
}
