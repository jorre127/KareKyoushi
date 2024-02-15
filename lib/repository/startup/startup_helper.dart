import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart';

@lazySingleton
class StartupHelper {
  final KanjiRepository _kanjiRepository;

  StartupHelper(
    this._kanjiRepository,
  );

  Future<void> startup() async {
    await _kanjiRepository.initKanji();
  }
}
