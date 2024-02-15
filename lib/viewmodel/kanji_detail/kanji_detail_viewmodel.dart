import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/kanji/kanji.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';

@injectable
class KanjiDetailViewModel with ChangeNotifierEx {
  late Kanji _kanji;

  final MainNavigator _navigator;

  Kanji get kanji => _kanji;

  KanjiDetailViewModel(
    this._navigator,
  );

  Future<void> init(Kanji kanji) async {
    _kanji = kanji;
  }

  void onCloseTapped() => _navigator.goBack();
}
