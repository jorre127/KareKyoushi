// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// FlutterNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i1;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' as _i5;
import 'package:kare_kyoushi/model/character/character.dart' as _i4;
import 'package:kare_kyoushi/model/enum/alphabet.dart' as _i2;
import 'package:kare_kyoushi/model/enum/difficulty_grade.dart' as _i3;

import '../model/character/character.dart';
import '../model/enum/alphabet.dart';
import '../model/enum/difficulty_grade.dart';
import '../screen/character_detail/character_detail_list_screen.dart';
import '../screen/character_detail/character_detail_screen.dart';
import '../screen/character_grade_list/character_grade_list_screen.dart';
import '../screen/character_list/character_list_screen.dart';
import '../screen/debug/debug_platform_selector_screen.dart';
import '../screen/debug/debug_screen.dart';
import '../screen/home/home_screen.dart';
import '../screen/license/license_screen.dart';
import '../screen/login/login_screen.dart';
import '../screen/main/main_screen.dart';
import '../screen/permission/analytics_permission_screen.dart';
import '../screen/permission/camera_permission_screen.dart';
import '../screen/permission/library_permission_screen.dart';
import '../screen/profile/edit_profile_screen.dart';
import '../screen/profile/profile_screen.dart';
import '../screen/splash/splash_screen.dart';
import '../screen/theme_mode/theme_mode_selector.dart';

mixin BaseNavigator {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments is Map ? (settings.arguments as Map).cast<String, dynamic>() : null;
    switch (settings.name) {
      case RouteNames.homeScreen:
        return MaterialPageRoute<void>(
          builder: (_) => HomeScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute<void>(
          builder: (_) => SplashScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.licenseScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LicenseScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.characterListScreen:
        return MaterialPageRoute<void>(
          builder: (_) => CharacterListScreen(
            alphabet: arguments!['alphabet'] as Alphabet,
            difficultyGrade: arguments['difficultyGrade'] as DifficultyGrade,
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.characterDetailScreen:
        return MaterialPageRoute<void>(
          builder: (_) => CharacterDetailScreen(
            character: arguments?['character'] as Character?,
            characterValue: arguments!['characterValue'] as String,
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case RouteNames.characterDetailListScreen:
        return MaterialPageRoute<void>(
          builder: (_) => CharacterDetailListScreen(
            alphabet: arguments!['alphabet'] as Alphabet,
            difficultyGrade: arguments['difficultyGrade'] as DifficultyGrade,
            character: arguments['character'] as Character,
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: true,
        );
      case RouteNames.profileScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ProfileScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.editProfileScreen:
        return MaterialPageRoute<void>(
          builder: (_) => EditProfileScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.characterGradeListScreen:
        return MaterialPageRoute<void>(
          builder: (_) => CharacterGradeListScreen(
            alphabet: arguments!['alphabet'] as Alphabet,
            key: arguments['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.mainScreen:
        return MaterialPageRoute<void>(
          builder: (_) => MainScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.cameraPermissionScreen:
        return MaterialPageRoute<bool>(
          builder: (_) => CameraPermissionScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.analyticsPermissionScreen:
        return MaterialPageRoute<void>(
          builder: (_) => AnalyticsPermissionScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.libraryPermissionScreen:
        return MaterialPageRoute<bool>(
          builder: (_) => LibraryPermissionScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.loginScreen:
        return MaterialPageRoute<void>(
          builder: (_) => LoginScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.themeModeSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => ThemeModeSelectorScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugPlatformSelectorScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugPlatformSelectorScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
      case RouteNames.debugScreen:
        return MaterialPageRoute<void>(
          builder: (_) => DebugScreen(
            key: arguments?['key'] as Key?,
          ),
          settings: settings,
          fullscreenDialog: false,
        );
    }
    return null;
  }

  Future<void> goToHomeScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.homeScreen,
        arguments: {'key': key},
      );
  void goToSplashScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.splashScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToLicenseScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.licenseScreen,
        arguments: {'key': key},
      );
  Future<void> goToCharacterListScreen({
    required _i2.Alphabet alphabet,
    required _i3.DifficultyGrade difficultyGrade,
    _i1.Key? key,
  }) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.characterListScreen,
        arguments: {'alphabet': alphabet, 'difficultyGrade': difficultyGrade, 'key': key},
      );
  Future<void> goToCharacterDetailScreen({
    required _i4.Character? character,
    required String characterValue,
    _i1.Key? key,
  }) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.characterDetailScreen,
        arguments: {'character': character, 'characterValue': characterValue, 'key': key},
      );
  Future<void> goToCharacterDetailListScreen({
    required _i2.Alphabet alphabet,
    required _i3.DifficultyGrade difficultyGrade,
    required _i4.Character character,
    _i5.Key? key,
  }) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.characterDetailListScreen,
        arguments: {'alphabet': alphabet, 'difficultyGrade': difficultyGrade, 'character': character, 'key': key},
      );
  Future<void> goToProfileScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.profileScreen,
        arguments: {'key': key},
      );
  Future<void> goToEditProfileScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.editProfileScreen,
        arguments: {'key': key},
      );
  Future<void> goToCharacterGradeListScreen({
    required _i2.Alphabet alphabet,
    _i1.Key? key,
  }) async =>
      navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.characterGradeListScreen,
        arguments: {'alphabet': alphabet, 'key': key},
      );
  void goToMainScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.mainScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<bool?> goToCameraPermissionScreen({_i1.Key? key}) async {
    final dynamic result = await navigatorKey.currentState?.pushNamed<dynamic>(
      RouteNames.cameraPermissionScreen,
      arguments: {'key': key},
    );
    return (result as bool?);
  }

  Future<void> goToAnalyticsPermissionScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.analyticsPermissionScreen,
        arguments: {'key': key},
      );
  Future<bool?> goToLibraryPermissionScreen({_i1.Key? key}) async {
    final dynamic result = await navigatorKey.currentState?.pushNamed<dynamic>(
      RouteNames.libraryPermissionScreen,
      arguments: {'key': key},
    );
    return (result as bool?);
  }

  void goToLoginScreen({_i1.Key? key}) => navigatorKey.currentState?.pushNamedAndRemoveUntil<dynamic>(
        RouteNames.loginScreen,
        (_) => false,
        arguments: {'key': key},
      );
  Future<void> goToThemeModeSelectorScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.themeModeSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugPlatformSelectorScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugPlatformSelectorScreen,
        arguments: {'key': key},
      );
  Future<void> goToDebugScreen({_i1.Key? key}) async => navigatorKey.currentState?.pushNamed<dynamic>(
        RouteNames.debugScreen,
        arguments: {'key': key},
      );
  void goBack() => navigatorKey.currentState?.pop();
  void goBackWithResult<T>({T? result}) => navigatorKey.currentState?.pop(result);
  void popUntil(bool Function(Route<dynamic>) predicate) => navigatorKey.currentState?.popUntil(predicate);
  void goBackTo(String routeName) => popUntil((route) => route.settings.name == routeName);
  Future<T?> showCustomDialog<T>({Widget? widget}) async => showDialog<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
  Future<T?> showBottomSheet<T>({Widget? widget}) async => showModalBottomSheet<T>(
        context: navigatorKey.currentContext!,
        builder: (_) => widget ?? const SizedBox.shrink(),
      );
}

class RouteNames {
  static const homeScreen = '/home';

  static const splashScreen = '/splash';

  static const licenseScreen = '/license';

  static const characterListScreen = '/character-list';

  static const characterDetailScreen = '/character-detail';

  static const characterDetailListScreen = '/character-detail-list';

  static const profileScreen = '/profile';

  static const editProfileScreen = '/edit-profile';

  static const characterGradeListScreen = '/character-grade-list';

  static const mainScreen = '/main';

  static const cameraPermissionScreen = '/camera-permission';

  static const analyticsPermissionScreen = '/analytics-permission';

  static const libraryPermissionScreen = '/library-permission';

  static const loginScreen = '/login';

  static const themeModeSelectorScreen = '/theme-mode-selector';

  static const debugPlatformSelectorScreen = '/debug-platform-selector';

  static const debugScreen = '/debug';
}
