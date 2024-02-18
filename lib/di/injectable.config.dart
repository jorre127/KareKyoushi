// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i49;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/character/character_dao_storage.dart'
    as _i23;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i12;
import 'package:kare_kyoushi/database/word/word_dao_storage.dart' as _i20;
import 'package:kare_kyoushi/di/injectable.dart' as _i50;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i14;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i36;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i26;
import 'package:kare_kyoushi/repository/character/character_repository.dart'
    as _i30;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i31;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i34;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i13;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i37;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i29;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i17;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i33;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i38;
import 'package:kare_kyoushi/repository/word/word_repository.dart' as _i28;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart'
    as _i7;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i35;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i15;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i16;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i46;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i8;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i19;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i22;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart'
    as _i40;
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart'
    as _i41;
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart'
    as _i42;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i25;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i48;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i43;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i44;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i32;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i27;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i45;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i39;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i47;
import 'package:kare_kyoushi/webservice/character/character_service.dart'
    as _i24;
import 'package:kare_kyoushi/webservice/word/word_service.dart' as _i21;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> initGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i3.CacheControlling>(_i4.CacheController());
    gh.singleton<_i5.ConnectivityHelper>(registerModule.connectivityHelper());
    await gh.singletonAsync<_i6.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true,
    );
    gh.lazySingleton<_i7.DifficultyGradeMatcher>(
        () => _i7.DifficultyGradeMatcher());
    gh.lazySingleton<_i8.ErrorUtil>(() => _i8.ErrorUtil());
    gh.lazySingleton<_i9.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i10.FirebaseAuth>(() => registerModule.firebaseAuth());
    gh.lazySingleton<_i11.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i12.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i13.LoginRepository>(
        () => _i13.LoginRepository(gh<_i10.FirebaseAuth>()));
    gh.lazySingleton<_i14.MainNavigator>(
        () => _i14.MainNavigator(gh<_i8.ErrorUtil>()));
    gh.singleton<_i15.NetworkErrorInterceptor>(
        _i15.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
    gh.lazySingleton<_i17.SecureStorage>(
        () => _i17.SecureStorage(gh<_i11.FlutterSecureStorage>()));
    await gh.singletonAsync<_i18.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i19.ThemeConfigUtil>(() => _i19.ThemeConfigUtil());
    gh.lazySingleton<_i20.WordDaoStorage>(
        () => _i20.WordDaoStorage(gh<_i12.KKDatabase>()));
    gh.lazySingleton<_i21.WordService>(
        () => _i21.WordService(gh<_i7.DifficultyGradeMatcher>()));
    gh.factory<_i22.BaseScreenViewModel>(
        () => _i22.BaseScreenViewModel(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i23.CharacterDaoStorage>(
        () => _i23.CharacterDaoStorage(gh<_i12.KKDatabase>()));
    gh.lazySingleton<_i24.CharacterService>(
        () => _i24.CharacterService(gh<_i7.DifficultyGradeMatcher>()));
    gh.factory<_i25.DebugPlatformSelectorViewModel>(
        () => _i25.DebugPlatformSelectorViewModel(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i26.FireBaseAnalyticsRepository>(
        () => _i26.FireBaseAnalyticsRepository(gh<_i9.FirebaseAnalytics>()));
    gh.factory<_i27.LicenseViewModel>(
        () => _i27.LicenseViewModel(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i18.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i17.SecureStorage>(),
            ));
    gh.lazySingleton<_i28.WordRepository>(() => _i28.WordRepository(
          gh<_i21.WordService>(),
          gh<_i20.WordDaoStorage>(),
        ));
    gh.lazySingleton<_i29.AuthStorage>(
        () => _i29.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i30.CharacterRepository>(() => _i30.CharacterRepository(
          gh<_i23.CharacterDaoStorage>(),
          gh<_i24.CharacterService>(),
        ));
    gh.lazySingleton<_i31.DebugRepository>(
        () => _i31.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.factory<_i32.HomeViewModel>(() => _i32.HomeViewModel(
          gh<_i14.MainNavigator>(),
          gh<_i30.CharacterRepository>(),
        ));
    gh.lazySingleton<_i33.LocalStorage>(() => _i33.LocalStorage(
          gh<_i29.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i34.LocaleRepository>(
        () => _i34.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.singleton<_i35.NetworkAuthInterceptor>(
        _i35.NetworkAuthInterceptor(gh<_i29.AuthStorage>()));
    gh.lazySingleton<_i36.OnboardingNavigator>(() => _i36.OnboardingNavigator(
          gh<_i14.MainNavigator>(),
          gh<_i33.LocalStorage>(),
          gh<_i13.LoginRepository>(),
        ));
    gh.lazySingleton<_i37.RefreshRepository>(
        () => _i37.RefreshRepository(gh<_i29.AuthStorage>()));
    gh.lazySingleton<_i38.StartupHelper>(() => _i38.StartupHelper(
          gh<_i30.CharacterRepository>(),
          gh<_i28.WordRepository>(),
        ));
    gh.factory<_i39.AnalyticsPermissionViewModel>(
        () => _i39.AnalyticsPermissionViewModel(
              gh<_i36.OnboardingNavigator>(),
              gh<_i33.LocalStorage>(),
            ));
    gh.factory<_i40.CharacterDetailViewModel>(
        () => _i40.CharacterDetailViewModel(
              gh<_i14.MainNavigator>(),
              gh<_i20.WordDaoStorage>(),
              gh<_i30.CharacterRepository>(),
            ));
    gh.factory<_i41.CharacterGradeListViewModel>(
        () => _i41.CharacterGradeListViewModel(
              gh<_i14.MainNavigator>(),
              gh<_i30.CharacterRepository>(),
            ));
    gh.factory<_i42.CharacterListViewModel>(() => _i42.CharacterListViewModel(
          gh<_i14.MainNavigator>(),
          gh<_i30.CharacterRepository>(),
        ));
    gh.factory<_i43.DebugViewModel>(() => _i43.DebugViewModel(
          gh<_i31.DebugRepository>(),
          gh<_i14.MainNavigator>(),
          gh<_i12.KKDatabase>(),
          gh<_i33.LocalStorage>(),
        ));
    gh.lazySingleton<_i44.GlobalViewModel>(() => _i44.GlobalViewModel(
          gh<_i34.LocaleRepository>(),
          gh<_i31.DebugRepository>(),
          gh<_i33.LocalStorage>(),
          gh<_i19.ThemeConfigUtil>(),
        ));
    gh.factory<_i45.LoginViewModel>(() => _i45.LoginViewModel(
          gh<_i13.LoginRepository>(),
          gh<_i36.OnboardingNavigator>(),
          gh<_i38.StartupHelper>(),
        ));
    gh.singleton<_i46.NetworkRefreshInterceptor>(_i46.NetworkRefreshInterceptor(
      gh<_i29.AuthStorage>(),
      gh<_i37.RefreshRepository>(),
    ));
    gh.factory<_i47.SplashViewModel>(() => _i47.SplashViewModel(
          gh<_i33.LocalStorage>(),
          gh<_i36.OnboardingNavigator>(),
          gh<_i38.StartupHelper>(),
        ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i16.NetworkLogInterceptor>(),
              gh<_i35.NetworkAuthInterceptor>(),
              gh<_i15.NetworkErrorInterceptor>(),
              gh<_i46.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i48.DebugThemeSelectorViewModel>(
        () => _i48.DebugThemeSelectorViewModel(
              gh<_i14.MainNavigator>(),
              gh<_i44.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i49.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i50.RegisterModule {}
