import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/word/word_dao_storage.dart';
import 'package:kare_kyoushi/model/character/character.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/model/enum/knowledge_level.dart';
import 'package:kare_kyoushi/model/webservice/word/word.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/character/character_repository.dart';
import 'package:kare_kyoushi/util/extension/string_extension.dart';

@injectable
class CharacterDetailViewModel with ChangeNotifierEx {
  late String _characterValue;

  Character? _character;
  String? _selectedReading;

  final MainNavigator _navigator;
  final WordDaoStorage _wordDaoStorage;
  final CharacterRepository _characterRepository;

  final _wordsContaining = <Word>[];

  Character? get character => _character;

  List<Word> get wordsContaining =>
      _selectedReading == null ? _wordsContaining : _wordsContaining.where((element) => element.reading.contains(_selectedReading!.filteredReading)).toList();

  bool get isKanji => _character?.alphbabet == Alphabet.kanji;

  String? get selectedReading => _selectedReading;

  CharacterDetailViewModel(
    this._navigator,
    this._wordDaoStorage,
    this._characterRepository,
  );

  Future<void> init(String characterValue) async {
    _characterValue = characterValue;
    await _getCharacter();
    await _initWordsContaining();
  }

  Future<void> _getCharacter() async => _character = await _characterRepository.getCharacter(_characterValue);

  Future<void> _initWordsContaining() async {
    final character = _character;
    if (character == null) return;
    final words = await _wordDaoStorage.getWordsContaining(character.value);
    _wordsContaining
      ..replaceAll(words)
      ..sortBy((item) => item.priority ?? 999);
    if (disposed) return;
    notifyListeners();
  }

  Future<void> _updateCharacter(KnowledgeLevel level) async {
    KnowledgeLevel? newLevel = level;
    if (character?.knowledgeLevel == level) {
      newLevel = null;
    }
    await _characterRepository.updateKnowledgeLevelForCharacter(level: newLevel, character: _characterValue);
    await _getCharacter();
    if (disposed) return;
    notifyListeners();
  }

  void onReadingTapped(String? reading) {
    _selectedReading = reading;
    notifyListeners();
  }

  void onMehTapped() => _updateCharacter(KnowledgeLevel.meh);

  void onGotItTapped() => _updateCharacter(KnowledgeLevel.gotIt);

  void onCloseTapped() => _navigator.goBack();
}
