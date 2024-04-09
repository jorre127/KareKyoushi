// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i58;
import 'package:drift/drift.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i11;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:image_picker/image_picker.dart' as _i13;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/character/character_dao_storage.dart'
    as _i29;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i14;
import 'package:kare_kyoushi/database/word/word_dao_storage.dart' as _i25;
import 'package:kare_kyoushi/di/injectable.dart' as _i59;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i16;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i46;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i33;
import 'package:kare_kyoushi/repository/character/character_repository.dart'
    as _i39;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i40;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i44;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i15;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i47;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i38;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i21;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i43;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i48;
import 'package:kare_kyoushi/repository/user/user_repository.dart' as _i24;
import 'package:kare_kyoushi/repository/word/word_repository.dart' as _i37;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart'
    as _i8;
import 'package:kare_kyoushi/util/image/image_picker_util.dart' as _i34;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i45;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i17;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i18;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i55;
import 'package:kare_kyoushi/util/permission/permission_util.dart' as _i19;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i9;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i23;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i27;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart'
    as _i5;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart'
    as _i50;
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart'
    as _i51;
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart'
    as _i30;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i32;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i57;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i52;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i53;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i42;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i36;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i54;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i49;
import 'package:kare_kyoushi/viewmodel/permission/camera_permission_viewmodel.dart'
    as _i28;
import 'package:kare_kyoushi/viewmodel/permission/library_permission_viewmodel.dart'
    as _i35;
import 'package:kare_kyoushi/viewmodel/profile/edit_profile_viewmodel.dart'
    as _i41;
import 'package:kare_kyoushi/viewmodel/profile/profile_viewmodel.dart' as _i20;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i56;
import 'package:kare_kyoushi/webservice/character/character_service.dart'
    as _i31;
import 'package:kare_kyoushi/webservice/word/word_service.dart' as _i26;
import 'package:shared_preferences/shared_preferences.dart' as _i22;

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
    gh.lazySingleton<_i13.ImagePicker>(() => registerModule.imagePicker());
    gh.lazySingleton<_i14.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i7.DatabaseConnection>()));
    gh.lazySingleton<_i15.LoginRepository>(
        () => _i15.LoginRepository(gh<_i11.FirebaseAuth>()));
    gh.lazySingleton<_i16.MainNavigator>(
        () => _i16.MainNavigator(gh<_i9.ErrorUtil>()));
    gh.singleton<_i17.NetworkErrorInterceptor>(
        _i17.NetworkErrorInterceptor(gh<_i6.ConnectivityHelper>()));
    gh.singleton<_i18.NetworkLogInterceptor>(_i18.NetworkLogInterceptor());
    gh.lazySingleton<_i19.PermissionUtil>(() => _i19.PermissionUtil());
    gh.factory<_i20.ProfileViewModel>(
        () => _i20.ProfileViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i21.SecureStorage>(
        () => _i21.SecureStorage(gh<_i12.FlutterSecureStorage>()));
    await gh.singletonAsync<_i22.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i23.ThemeConfigUtil>(() => _i23.ThemeConfigUtil());
    gh.lazySingleton<_i24.UserRepository>(() => _i24.UserRepository());
    gh.lazySingleton<_i25.WordDaoStorage>(
        () => _i25.WordDaoStorage(gh<_i14.KKDatabase>()));
    gh.lazySingleton<_i26.WordService>(
        () => _i26.WordService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i27.BaseScreenViewModel>(
        () => _i27.BaseScreenViewModel(gh<_i16.MainNavigator>()));
    gh.factory<_i28.CameraPermissionViewModel>(
        () => _i28.CameraPermissionViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i29.CharacterDaoStorage>(
        () => _i29.CharacterDaoStorage(gh<_i14.KKDatabase>()));
    gh.factory<_i30.CharacterListViewModel>(
        () => _i30.CharacterListViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i31.CharacterService>(
        () => _i31.CharacterService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i32.DebugPlatformSelectorViewModel>(
        () => _i32.DebugPlatformSelectorViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i33.FireBaseAnalyticsRepository>(
        () => _i33.FireBaseAnalyticsRepository(gh<_i10.FirebaseAnalytics>()));
    gh.lazySingleton<_i34.ImagePickerUtil>(() => _i34.ImagePickerUtil(
          gh<_i16.MainNavigator>(),
          gh<_i13.ImagePicker>(),
          gh<_i19.PermissionUtil>(),
        ));
    gh.factory<_i35.LibraryPermissionViewModel>(
        () => _i35.LibraryPermissionViewModel(gh<_i16.MainNavigator>()));
    gh.factory<_i36.LicenseViewModel>(
        () => _i36.LicenseViewModel(gh<_i16.MainNavigator>()));
    gh.lazySingleton<_i6.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i22.SharedPreferences>()));
    gh.lazySingleton<_i6.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i6.SharedPreferenceStorage>(),
              gh<_i21.SecureStorage>(),
            ));
    gh.lazySingleton<_i37.WordRepository>(() => _i37.WordRepository(
          gh<_i26.WordService>(),
          gh<_i25.WordDaoStorage>(),
        ));
    gh.lazySingleton<_i38.AuthStorage>(
        () => _i38.AuthStorage(gh<_i6.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i39.CharacterRepository>(() => _i39.CharacterRepository(
          gh<_i29.CharacterDaoStorage>(),
          gh<_i31.CharacterService>(),
        ));
    gh.lazySingleton<_i40.DebugRepository>(
        () => _i40.DebugRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.factory<_i41.EditProfileViewModel>(() => _i41.EditProfileViewModel(
          gh<_i24.UserRepository>(),
          gh<_i34.ImagePickerUtil>(),
        ));
    gh.factory<_i42.HomeViewModel>(() => _i42.HomeViewModel(
          gh<_i16.MainNavigator>(),
          gh<_i39.CharacterRepository>(),
        ));
    gh.lazySingleton<_i43.LocalStorage>(() => _i43.LocalStorage(
          gh<_i38.AuthStorage>(),
          gh<_i6.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i44.LocaleRepository>(
        () => _i44.LocaleRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.singleton<_i45.NetworkAuthInterceptor>(
        _i45.NetworkAuthInterceptor(gh<_i38.AuthStorage>()));
    gh.lazySingleton<_i46.OnboardingNavigator>(() => _i46.OnboardingNavigator(
          gh<_i16.MainNavigator>(),
          gh<_i43.LocalStorage>(),
          gh<_i15.LoginRepository>(),
        ));
    gh.lazySingleton<_i47.RefreshRepository>(
        () => _i47.RefreshRepository(gh<_i38.AuthStorage>()));
    gh.lazySingleton<_i48.StartupHelper>(() => _i48.StartupHelper(
          gh<_i39.CharacterRepository>(),
          gh<_i37.WordRepository>(),
          gh<_i24.UserRepository>(),
        ));
    gh.factory<_i49.AnalyticsPermissionViewModel>(
        () => _i49.AnalyticsPermissionViewModel(
              gh<_i46.OnboardingNavigator>(),
              gh<_i43.LocalStorage>(),
            ));
    gh.factory<_i50.CharacterDetailViewModel>(
        () => _i50.CharacterDetailViewModel(
              gh<_i16.MainNavigator>(),
              gh<_i25.WordDaoStorage>(),
              gh<_i39.CharacterRepository>(),
            ));
    gh.factory<_i51.CharacterGradeListViewModel>(
        () => _i51.CharacterGradeListViewModel(
              gh<_i16.MainNavigator>(),
              gh<_i39.CharacterRepository>(),
            ));
    gh.factory<_i52.DebugViewModel>(() => _i52.DebugViewModel(
          gh<_i40.DebugRepository>(),
          gh<_i16.MainNavigator>(),
          gh<_i14.KKDatabase>(),
          gh<_i43.LocalStorage>(),
        ));
    gh.lazySingleton<_i53.GlobalViewModel>(() => _i53.GlobalViewModel(
          gh<_i44.LocaleRepository>(),
          gh<_i40.DebugRepository>(),
          gh<_i43.LocalStorage>(),
          gh<_i23.ThemeConfigUtil>(),
        ));
    gh.factory<_i54.LoginViewModel>(() => _i54.LoginViewModel(
          gh<_i15.LoginRepository>(),
          gh<_i46.OnboardingNavigator>(),
          gh<_i48.StartupHelper>(),
        ));
    gh.singleton<_i55.NetworkRefreshInterceptor>(_i55.NetworkRefreshInterceptor(
      gh<_i38.AuthStorage>(),
      gh<_i47.RefreshRepository>(),
    ));
    gh.factory<_i56.SplashViewModel>(() => _i56.SplashViewModel(
          gh<_i43.LocalStorage>(),
          gh<_i46.OnboardingNavigator>(),
          gh<_i48.StartupHelper>(),
        ));
    gh.lazySingleton<_i6.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i18.NetworkLogInterceptor>(),
              gh<_i45.NetworkAuthInterceptor>(),
              gh<_i17.NetworkErrorInterceptor>(),
              gh<_i55.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i57.DebugThemeSelectorViewModel>(
        () => _i57.DebugThemeSelectorViewModel(
              gh<_i16.MainNavigator>(),
              gh<_i53.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i58.Dio>(
        () => registerModule.provideDio(gh<_i6.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i59.RegisterModule {}
