import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart';
import 'package:kare_kyoushi/di/injectable.dart';
import 'package:kare_kyoushi/navigator/main_navigator.dart';
import 'package:kare_kyoushi/repository/debug/debug_repository.dart';
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart';
import 'package:kare_kyoushi/webservice/character/character_service.dart';
import 'package:kare_kyoushi/widget/debug/select_language_dialog.dart';

@injectable
class DebugViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final DebugRepository _debugRepo;
  final LocalStorage _localStorage;
  final KKDatabase _db;

  var slowAnimationsEnabled = false;

  DebugViewModel(
    this._debugRepo,
    this._navigator,
    this._db,
    this._localStorage,
  );

  Future<void> init() async {
    _initValues();
    await getIt.get<CharacterService>().getCharacters();
  }

  void _initValues() {
    slowAnimationsEnabled = _debugRepo.isSlowAnimationsEnabled();
    notifyListeners();
  }

  // ignore: avoid_positional_boolean_parameters
  Future<void> onSlowAnimationsChanged(bool enabled) async {
    await _debugRepo.saveSlowAnimations(enabled: enabled);
    _initValues();
  }

  void onTargetPlatformClicked() => _navigator.goToDebugPlatformSelectorScreen();

  void onThemeModeClicked() => _navigator.goToThemeModeSelectorScreen();

  void onSelectLanguageClicked() => _navigator.showCustomDialog<void>(widget: SelectLanguageDialog(goBack: _navigator.goBack));

  void onLicensesClicked() => _navigator.goToLicenseScreen();

  void goToDatabase() => _navigator.goToDatabase(_db);

  void goToAnalyticsPermissionScreen() => _navigator.goToAnalyticsPermissionScreen();

  void resetAnalyticsPermission() => _localStorage.updateHasAnalyticsPermission(null);
}
