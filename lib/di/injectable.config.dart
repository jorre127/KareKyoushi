// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i40;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i8;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i11;
import 'package:kare_kyoushi/di/injectable.dart' as _i41;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i14;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i31;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i22;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i27;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i29;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i13;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i32;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i26;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i17;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i28;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i30;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i15;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i16;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i38;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i7;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i19;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i20;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i21;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i39;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i35;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i36;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i23;
import 'package:kare_kyoushi/viewmodel/kanji_grade_list/kanji_grade_list_viewmodel.dart'
    as _i24;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i25;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i37;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i34;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i33;
import 'package:kare_kyoushi/webservice/kanji/kanji_service.dart' as _i12;
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
    gh.lazySingleton<_i7.ErrorUtil>(() => _i7.ErrorUtil());
    gh.lazySingleton<_i8.FirebaseAnalytics>(
        () => registerModule.provideFirebaseAnalytics());
    gh.lazySingleton<_i9.FirebaseAuth>(() => registerModule.firebaseAuth());
    gh.lazySingleton<_i10.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i11.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i12.KanjiService>(() => _i12.KanjiService());
    gh.lazySingleton<_i13.LoginRepository>(
        () => _i13.LoginRepository(gh<_i9.FirebaseAuth>()));
    gh.lazySingleton<_i14.MainNavigator>(
        () => _i14.MainNavigator(gh<_i7.ErrorUtil>()));
    gh.singleton<_i15.NetworkErrorInterceptor>(
        _i15.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i16.NetworkLogInterceptor>(_i16.NetworkLogInterceptor());
    gh.lazySingleton<_i17.SecureStorage>(
        () => _i17.SecureStorage(gh<_i10.FlutterSecureStorage>()));
    await gh.singletonAsync<_i18.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i19.ThemeConfigUtil>(() => _i19.ThemeConfigUtil());
    gh.factory<_i20.BaseScreenViewModel>(
        () => _i20.BaseScreenViewModel(gh<_i14.MainNavigator>()));
    gh.factory<_i21.DebugPlatformSelectorViewModel>(
        () => _i21.DebugPlatformSelectorViewModel(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i22.FireBaseAnalyticsRepository>(
        () => _i22.FireBaseAnalyticsRepository(gh<_i8.FirebaseAnalytics>()));
    gh.factory<_i23.HomeViewModel>(
        () => _i23.HomeViewModel(gh<_i14.MainNavigator>()));
    gh.factory<_i24.KanjiGradeListViewModel>(
        () => _i24.KanjiGradeListViewModel(gh<_i14.MainNavigator>()));
    gh.factory<_i25.LicenseViewModel>(
        () => _i25.LicenseViewModel(gh<_i14.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i18.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i17.SecureStorage>(),
            ));
    gh.lazySingleton<_i26.AuthStorage>(
        () => _i26.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i27.DebugRepository>(
        () => _i27.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.lazySingleton<_i28.LocalStorage>(() => _i28.LocalStorage(
          gh<_i26.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i29.LocaleRepository>(
        () => _i29.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.singleton<_i30.NetworkAuthInterceptor>(
        _i30.NetworkAuthInterceptor(gh<_i26.AuthStorage>()));
    gh.lazySingleton<_i31.OnboardingNavigator>(() => _i31.OnboardingNavigator(
          gh<_i14.MainNavigator>(),
          gh<_i28.LocalStorage>(),
          gh<_i13.LoginRepository>(),
        ));
    gh.lazySingleton<_i32.RefreshRepository>(
        () => _i32.RefreshRepository(gh<_i26.AuthStorage>()));
    gh.factory<_i33.SplashViewModel>(() => _i33.SplashViewModel(
          gh<_i28.LocalStorage>(),
          gh<_i31.OnboardingNavigator>(),
        ));
    gh.factory<_i34.AnalyticsPermissionViewModel>(
        () => _i34.AnalyticsPermissionViewModel(
              gh<_i31.OnboardingNavigator>(),
              gh<_i28.LocalStorage>(),
            ));
    gh.factory<_i35.DebugViewModel>(() => _i35.DebugViewModel(
          gh<_i27.DebugRepository>(),
          gh<_i14.MainNavigator>(),
          gh<_i11.KKDatabase>(),
          gh<_i28.LocalStorage>(),
        ));
    gh.lazySingleton<_i36.GlobalViewModel>(() => _i36.GlobalViewModel(
          gh<_i29.LocaleRepository>(),
          gh<_i27.DebugRepository>(),
          gh<_i28.LocalStorage>(),
          gh<_i19.ThemeConfigUtil>(),
        ));
    gh.factory<_i37.LoginViewModel>(() => _i37.LoginViewModel(
          gh<_i13.LoginRepository>(),
          gh<_i31.OnboardingNavigator>(),
        ));
    gh.singleton<_i38.NetworkRefreshInterceptor>(_i38.NetworkRefreshInterceptor(
      gh<_i26.AuthStorage>(),
      gh<_i32.RefreshRepository>(),
    ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i16.NetworkLogInterceptor>(),
              gh<_i30.NetworkAuthInterceptor>(),
              gh<_i15.NetworkErrorInterceptor>(),
              gh<_i38.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i39.DebugThemeSelectorViewModel>(
        () => _i39.DebugThemeSelectorViewModel(
              gh<_i14.MainNavigator>(),
              gh<_i36.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i40.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i41.RegisterModule {}
