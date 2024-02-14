import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';

@injectable
class BaseScreenViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;

  BaseScreenViewModel(this._navigator);

  void onBackTapped() => _navigator.goBack();
}
