import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';

mixin CharactersMixin on ChangeNotifierEx {
  late DifficultyGrade _difficultyGrade;
  late Alphabet _alphabet;

  final CharacterRepository _characterRepository = getIt();

  final _characters = <Character>[];

  DifficultyGrade get difficultyGrade => _difficultyGrade;

  Alphabet get alphabet => _alphabet;

  List<Character> get characters => _characters;

  void initCharacters({
    required DifficultyGrade difficultyGrade,
    required Alphabet alphabet,
  }) {
    _difficultyGrade = difficultyGrade;
    _alphabet = alphabet;
    registerDisposeStream(_characterRepository.getCharacterForLevelStream(level: _difficultyGrade, alphabet: _alphabet).listen(_oncharacterUpdated));
  }

  Future<void> _oncharacterUpdated(List<Character> character) async {
    _characters.replaceAll((character));
    oncharacterUpdated(_characters);
    if (disposed) return;
    notifyListeners();
  }

  void oncharacterUpdated(List<Character> character) {}
}
