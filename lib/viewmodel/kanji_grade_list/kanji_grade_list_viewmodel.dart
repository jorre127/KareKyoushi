import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';

@injectable
class KanjiGradeListViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  KanjiGradeListViewModel(
    this._navigator,
  );

  Future<void> init() async {}
}
