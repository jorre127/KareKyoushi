// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i37;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i10;
import 'package:kare_kyoushi/di/injectable.dart' as _i38;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i12;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i28;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i20;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i23;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i25;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i26;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i29;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i22;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i15;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i24;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i27;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i13;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i14;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i35;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i7;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i17;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i18;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i19;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i36;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i32;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i33;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i21;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i34;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i31;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i30;
import 'package:kare_kyoushi/webservice/kanji/kanji_service.dart' as _i11;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

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
    gh.lazySingleton<_i9.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i10.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i11.KanjiService>(() => _i11.KanjiService());
    gh.lazySingleton<_i12.MainNavigator>(
        () => _i12.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i13.NetworkErrorInterceptor>(
        _i13.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i14.NetworkLogInterceptor>(_i14.NetworkLogInterceptor());
    gh.lazySingleton<_i15.SecureStorage>(
        () => _i15.SecureStorage(gh<_i9.FlutterSecureStorage>()));
    await gh.singletonAsync<_i16.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i17.ThemeConfigUtil>(() => _i17.ThemeConfigUtil());
    gh.factory<_i18.BaseScreenViewModel>(
        () => _i18.BaseScreenViewModel(gh<_i12.MainNavigator>()));
    gh.factory<_i19.DebugPlatformSelectorViewModel>(
        () => _i19.DebugPlatformSelectorViewModel(gh<_i12.MainNavigator>()));
    gh.lazySingleton<_i20.FireBaseAnalyticsRepository>(
        () => _i20.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i21.LicenseViewModel>(
        () => _i21.LicenseViewModel(gh<_i12.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i16.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i15.SecureStorage>(),
            ));
    gh.lazySingleton<_i22.AuthStorage>(
        () => _i22.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i23.DebugRepository>(
        () => _i23.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i24.LocalStorage>(() => _i24.LocalStorage(
          gh<_i22.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i25.LocaleRepository>(
        () => _i25.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i26.LoginRepository>(
        () => _i26.LoginRepository(gh<_i22.AuthStorage>()));
    gh.singleton<_i27.NetworkAuthInterceptor>(
        _i27.NetworkAuthInterceptor(gh<_i22.AuthStorage>()));
    gh.lazySingleton<_i28.OnboardingNavigator>(() => _i28.OnboardingNavigator(
          gh<_i12.MainNavigator>(),
          gh<_i24.LocalStorage>(),
          gh<_i26.LoginRepository>(),
        ));
    gh.lazySingleton<_i29.RefreshRepository>(
        () => _i29.RefreshRepository(gh<_i22.AuthStorage>()));
    gh.factory<_i30.SplashViewModel>(() => _i30.SplashViewModel(
          gh<_i24.LocalStorage>(),
          gh<_i28.OnboardingNavigator>(),
        ));
    gh.factory<_i31.AnalyticsPermissionViewModel>(
        () => _i31.AnalyticsPermissionViewModel(
              gh<_i28.OnboardingNavigator>(),
              gh<_i24.LocalStorage>(),
            ));
    gh.factory<_i32.DebugViewModel>(() => _i32.DebugViewModel(
          gh<_i23.DebugRepository>(),
          gh<_i12.MainNavigator>(),
          gh<_i10.KKDatabase>(),
          gh<_i24.LocalStorage>(),
        ));
    gh.lazySingleton<_i33.GlobalViewModel>(() => _i33.GlobalViewModel(
          gh<_i25.LocaleRepository>(),
          gh<_i23.DebugRepository>(),
          gh<_i24.LocalStorage>(),
          gh<_i17.ThemeConfigUtil>(),
        ));
    gh.factory<_i34.LoginViewModel>(() => _i34.LoginViewModel(
          gh<_i26.LoginRepository>(),
          gh<_i12.MainNavigator>(),
          gh<_i28.OnboardingNavigator>(),
        ));
    gh.singleton<_i35.NetworkRefreshInterceptor>(_i35.NetworkRefreshInterceptor(
      gh<_i22.AuthStorage>(),
      gh<_i29.RefreshRepository>(),
    ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i14.NetworkLogInterceptor>(),
              gh<_i27.NetworkAuthInterceptor>(),
              gh<_i13.NetworkErrorInterceptor>(),
              gh<_i35.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i36.DebugThemeSelectorViewModel>(
        () => _i36.DebugThemeSelectorViewModel(
              gh<_i12.MainNavigator>(),
              gh<_i33.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i37.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i38.RegisterModule {}
