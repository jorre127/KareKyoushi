// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i52;
import 'package:drift/drift.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/character/character_dao_storage.dart'
    as _i26;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i13;
import 'package:kare_kyoushi/database/word/word_dao_storage.dart' as _i23;
import 'package:kare_kyoushi/di/injectable.dart' as _i53;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i15;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i40;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i30;
import 'package:kare_kyoushi/repository/character/character_repository.dart'
    as _i34;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i35;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i38;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i14;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i41;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i33;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i19;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i37;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i42;
import 'package:kare_kyoushi/repository/user/user_repository.dart' as _i22;
import 'package:kare_kyoushi/repository/word/word_repository.dart' as _i32;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart'
    as _i8;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i39;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i16;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i17;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i49;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i9;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i21;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i25;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart'
    as _i5;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart'
    as _i44;
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart'
    as _i45;
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart'
    as _i27;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i29;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i51;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i46;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i47;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i36;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i31;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i48;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i43;
import 'package:kare_kyoushi/viewmodel/profile/profile_viewmodel.dart' as _i18;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i50;
import 'package:kare_kyoushi/webservice/character/character_service.dart'
    as _i28;
import 'package:kare_kyoushi/webservice/word/word_service.dart' as _i24;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

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
    gh.factory<_i5.CharacterDetailListViewmodel>(
        () => _i5.CharacterDetailListViewmodel());
    gh.singleton<_i6.ConnectivityHelper>(registerModule.connectivityHelper());
    await gh.singletonAsync<_i7.DatabaseConnection>(
      () => registerModule.provideDatabaseConnection(),
      preResolve: true,
    );
    gh.lazySingleton<_i8.DifficultyGradeMatcher>(
        () => _i8.DifficultyGradeMatcher());
    gh.lazySingleton<_i9.ErrorUtil>(() => _i9.ErrorUtil());
    gh.lazySingleton<_i10.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i11.FirebaseAuth>(() => registerModule.firebaseAuth());
    gh.lazySingleton<_i12.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i13.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i7.DatabaseConnection>()));
    gh.lazySingleton<_i14.LoginRepository>(
        () => _i14.LoginRepository(gh<_i11.FirebaseAuth>()));
    gh.lazySingleton<_i15.MainNavigator>(
        () => _i15.MainNavigator(gh<_i9.ErrorUtil>()));
    gh.singleton<_i16.NetworkErrorInterceptor>(
        _i16.NetworkErrorInterceptor(gh<_i6.ConnectivityHelper>()));
    gh.singleton<_i17.NetworkLogInterceptor>(_i17.NetworkLogInterceptor());
    gh.factory<_i18.ProfileViewModel>(
        () => _i18.ProfileViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i19.SecureStorage>(
        () => _i19.SecureStorage(gh<_i12.FlutterSecureStorage>()));
    await gh.singletonAsync<_i20.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i21.ThemeConfigUtil>(() => _i21.ThemeConfigUtil());
    gh.lazySingleton<_i22.UserRepository>(() => _i22.UserRepository());
    gh.lazySingleton<_i23.WordDaoStorage>(
        () => _i23.WordDaoStorage(gh<_i13.KKDatabase>()));
    gh.lazySingleton<_i24.WordService>(
        () => _i24.WordService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i25.BaseScreenViewModel>(
        () => _i25.BaseScreenViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i26.CharacterDaoStorage>(
        () => _i26.CharacterDaoStorage(gh<_i13.KKDatabase>()));
    gh.factory<_i27.CharacterListViewModel>(
        () => _i27.CharacterListViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i28.CharacterService>(
        () => _i28.CharacterService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i29.DebugPlatformSelectorViewModel>(
        () => _i29.DebugPlatformSelectorViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i30.FireBaseAnalyticsRepository>(
        () => _i30.FireBaseAnalyticsRepository(gh<_i10.FirebaseAnalytics>()));
    gh.factory<_i31.LicenseViewModel>(
        () => _i31.LicenseViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i6.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i20.SharedPreferences>()));
    gh.lazySingleton<_i6.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i6.SharedPreferenceStorage>(),
              gh<_i19.SecureStorage>(),
            ));
    gh.lazySingleton<_i32.WordRepository>(() => _i32.WordRepository(
          gh<_i24.WordService>(),
          gh<_i23.WordDaoStorage>(),
        ));
    gh.lazySingleton<_i33.AuthStorage>(
        () => _i33.AuthStorage(gh<_i6.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i34.CharacterRepository>(() => _i34.CharacterRepository(
          gh<_i26.CharacterDaoStorage>(),
          gh<_i28.CharacterService>(),
        ));
    gh.lazySingleton<_i35.DebugRepository>(
        () => _i35.DebugRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.factory<_i36.HomeViewModel>(() => _i36.HomeViewModel(
          gh<_i15.MainNavigator>(),
          gh<_i34.CharacterRepository>(),
        ));
    gh.lazySingleton<_i37.LocalStorage>(() => _i37.LocalStorage(
          gh<_i33.AuthStorage>(),
          gh<_i6.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i38.LocaleRepository>(
        () => _i38.LocaleRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.singleton<_i39.NetworkAuthInterceptor>(
        _i39.NetworkAuthInterceptor(gh<_i33.AuthStorage>()));
    gh.lazySingleton<_i40.OnboardingNavigator>(() => _i40.OnboardingNavigator(
          gh<_i15.MainNavigator>(),
          gh<_i37.LocalStorage>(),
          gh<_i14.LoginRepository>(),
        ));
    gh.lazySingleton<_i41.RefreshRepository>(
        () => _i41.RefreshRepository(gh<_i33.AuthStorage>()));
    gh.lazySingleton<_i42.StartupHelper>(() => _i42.StartupHelper(
          gh<_i34.CharacterRepository>(),
          gh<_i32.WordRepository>(),
          gh<_i22.UserRepository>(),
        ));
    gh.factory<_i43.AnalyticsPermissionViewModel>(
        () => _i43.AnalyticsPermissionViewModel(
              gh<_i40.OnboardingNavigator>(),
              gh<_i37.LocalStorage>(),
            ));
    gh.factory<_i44.CharacterDetailViewModel>(
        () => _i44.CharacterDetailViewModel(
              gh<_i15.MainNavigator>(),
              gh<_i23.WordDaoStorage>(),
              gh<_i34.CharacterRepository>(),
            ));
    gh.factory<_i45.CharacterGradeListViewModel>(
        () => _i45.CharacterGradeListViewModel(
              gh<_i15.MainNavigator>(),
              gh<_i34.CharacterRepository>(),
            ));
    gh.factory<_i46.DebugViewModel>(() => _i46.DebugViewModel(
          gh<_i35.DebugRepository>(),
          gh<_i15.MainNavigator>(),
          gh<_i13.KKDatabase>(),
          gh<_i37.LocalStorage>(),
        ));
    gh.lazySingleton<_i47.GlobalViewModel>(() => _i47.GlobalViewModel(
          gh<_i38.LocaleRepository>(),
          gh<_i35.DebugRepository>(),
          gh<_i37.LocalStorage>(),
          gh<_i21.ThemeConfigUtil>(),
        ));
    gh.factory<_i48.LoginViewModel>(() => _i48.LoginViewModel(
          gh<_i14.LoginRepository>(),
          gh<_i40.OnboardingNavigator>(),
          gh<_i42.StartupHelper>(),
        ));
    gh.singleton<_i49.NetworkRefreshInterceptor>(_i49.NetworkRefreshInterceptor(
      gh<_i33.AuthStorage>(),
      gh<_i41.RefreshRepository>(),
    ));
    gh.factory<_i50.SplashViewModel>(() => _i50.SplashViewModel(
          gh<_i37.LocalStorage>(),
          gh<_i40.OnboardingNavigator>(),
          gh<_i42.StartupHelper>(),
        ));
    gh.lazySingleton<_i6.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i17.NetworkLogInterceptor>(),
              gh<_i39.NetworkAuthInterceptor>(),
              gh<_i16.NetworkErrorInterceptor>(),
              gh<_i49.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i51.DebugThemeSelectorViewModel>(
        () => _i51.DebugThemeSelectorViewModel(
              gh<_i15.MainNavigator>(),
              gh<_i47.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i52.Dio>(
        () => registerModule.provideDio(gh<_i6.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i53.RegisterModule {}
