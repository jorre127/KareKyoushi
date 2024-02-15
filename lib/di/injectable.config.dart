// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i45;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/kanji/kanji_dao_storage.dart' as _i12;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i11;
import 'package:kare_kyoushi/di/injectable.dart' as _i46;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i15;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i36;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i23;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i30;
import 'package:kare_kyoushi/repository/kanji/kanji_repository.dart' as _i26;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i34;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i14;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i37;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i29;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i18;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i33;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i28;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i35;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i16;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i17;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i43;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i7;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i20;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i21;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i22;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i44;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i40;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i41;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i24;
import 'package:kare_kyoushi/viewmodel/kanji_detail/kanji_detail_viewmodel.dart'
    as _i25;
import 'package:kare_kyoushi/viewmodel/kanji_grade_list/kanji_grade_list_viewmodel.dart'
    as _i31;
import 'package:kare_kyoushi/viewmodel/kanji_list/kanji_list_viewmodel.dart'
    as _i32;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i27;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i42;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i39;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i38;
import 'package:kare_kyoushi/webservice/kanji/kanji_service.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

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
    gh.lazySingleton<_i7.ErrorUtil>(() => _i7.ErrorUtil());
    gh.lazySingleton<_i8.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i9.FirebaseAuth>(() => registerModule.firebaseAuth());
    gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i11.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i12.KanjiDaoStorage>(
        () => _i12.KanjiDaoStorage(gh<_i11.KKDatabase>()));
    gh.lazySingleton<_i13.KanjiService>(() => _i13.KanjiService());
    gh.lazySingleton<_i14.LoginRepository>(
        () => _i14.LoginRepository(gh<_i9.FirebaseAuth>()));
    gh.lazySingleton<_i15.MainNavigator>(
        () => _i15.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i16.NetworkErrorInterceptor>(
        _i16.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i17.NetworkLogInterceptor>(_i17.NetworkLogInterceptor());
    gh.lazySingleton<_i18.SecureStorage>(
        () => _i18.SecureStorage(gh<_i10.FlutterSecureStorage>()));
    await gh.singletonAsync<_i19.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i20.ThemeConfigUtil>(() => _i20.ThemeConfigUtil());
    gh.factory<_i21.BaseScreenViewModel>(
        () => _i21.BaseScreenViewModel(gh<_i15.MainNavigator>()));
    gh.factory<_i22.DebugPlatformSelectorViewModel>(
        () => _i22.DebugPlatformSelectorViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i23.FireBaseAnalyticsRepository>(
        () => _i23.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i24.HomeViewModel>(
        () => _i24.HomeViewModel(gh<_i15.MainNavigator>()));
    gh.factory<_i25.KanjiDetailViewModel>(
        () => _i25.KanjiDetailViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i26.KanjiRepository>(() => _i26.KanjiRepository(
          gh<_i12.KanjiDaoStorage>(),
          gh<_i13.KanjiService>(),
        ));
    gh.factory<_i27.LicenseViewModel>(
        () => _i27.LicenseViewModel(gh<_i15.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i19.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i18.SecureStorage>(),
            ));
    gh.lazySingleton<_i28.StartupHelper>(
        () => _i28.StartupHelper(gh<_i26.KanjiRepository>()));
    gh.lazySingleton<_i29.AuthStorage>(
        () => _i29.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i30.DebugRepository>(
        () => _i30.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.factory<_i31.KanjiGradeListViewModel>(() => _i31.KanjiGradeListViewModel(
          gh<_i15.MainNavigator>(),
          gh<_i26.KanjiRepository>(),
        ));
    gh.factory<_i32.KanjiListViewModel>(() => _i32.KanjiListViewModel(
          gh<_i15.MainNavigator>(),
          gh<_i26.KanjiRepository>(),
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
          gh<_i15.MainNavigator>(),
          gh<_i33.LocalStorage>(),
          gh<_i14.LoginRepository>(),
        ));
    gh.lazySingleton<_i37.RefreshRepository>(
        () => _i37.RefreshRepository(gh<_i29.AuthStorage>()));
    gh.factory<_i38.SplashViewModel>(() => _i38.SplashViewModel(
          gh<_i33.LocalStorage>(),
          gh<_i36.OnboardingNavigator>(),
          gh<_i28.StartupHelper>(),
        ));
    gh.factory<_i39.AnalyticsPermissionViewModel>(
        () => _i39.AnalyticsPermissionViewModel(
              gh<_i36.OnboardingNavigator>(),
              gh<_i33.LocalStorage>(),
            ));
    gh.factory<_i40.DebugViewModel>(() => _i40.DebugViewModel(
          gh<_i30.DebugRepository>(),
          gh<_i15.MainNavigator>(),
          gh<_i11.KKDatabase>(),
          gh<_i33.LocalStorage>(),
        ));
    gh.lazySingleton<_i41.GlobalViewModel>(() => _i41.GlobalViewModel(
          gh<_i34.LocaleRepository>(),
          gh<_i30.DebugRepository>(),
          gh<_i33.LocalStorage>(),
          gh<_i20.ThemeConfigUtil>(),
        ));
    gh.factory<_i42.LoginViewModel>(() => _i42.LoginViewModel(
          gh<_i14.LoginRepository>(),
          gh<_i36.OnboardingNavigator>(),
          gh<_i28.StartupHelper>(),
        ));
    gh.singleton<_i43.NetworkRefreshInterceptor>(_i43.NetworkRefreshInterceptor(
      gh<_i29.AuthStorage>(),
      gh<_i37.RefreshRepository>(),
    ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i17.NetworkLogInterceptor>(),
              gh<_i35.NetworkAuthInterceptor>(),
              gh<_i16.NetworkErrorInterceptor>(),
              gh<_i43.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i44.DebugThemeSelectorViewModel>(
        () => _i44.DebugThemeSelectorViewModel(
              gh<_i15.MainNavigator>(),
              gh<_i41.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i45.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i46.RegisterModule {}
