import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/model/enum/alphabet.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';

@injectable
class HomeViewModel with ChangeNotifierEx {
  // ignore: unused_field
  final MainNavigator _navigator;

  HomeViewModel(
    this._navigator,
  );

  Future<void> init() async {}

  void onAlphabetTapped(Alphbabet alphbabet) => switch (alphbabet) {
        Alphbabet.hiragana => null,
        Alphbabet.katakana => null,
        Alphbabet.kanji => _navigator.goToKanjiGradeListScreen(),
      };
}
