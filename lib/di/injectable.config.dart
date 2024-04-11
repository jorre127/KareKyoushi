// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i11;
import 'package:dio/dio.dart' as _i62;
import 'package:drift/drift.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i9;
import 'package:firebase_auth/firebase_auth.dart' as _i10;
import 'package:firebase_storage/firebase_storage.dart' as _i12;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i5;
import 'package:image_picker/image_picker.dart' as _i14;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/character/character_dao_storage.dart'
    as _i31;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i15;
import 'package:kare_kyoushi/database/word/word_dao_storage.dart' as _i27;
import 'package:kare_kyoushi/di/injectable.dart' as _i63;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i17;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i49;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i35;
import 'package:kare_kyoushi/repository/character/character_repository.dart'
    as _i42;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i43;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i47;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i16;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i50;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i41;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i22;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i46;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i51;
import 'package:kare_kyoushi/repository/user/user_repository.dart' as _i39;
import 'package:kare_kyoushi/repository/word/word_repository.dart' as _i40;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart'
    as _i7;
import 'package:kare_kyoushi/util/image/image_picker_util.dart' as _i36;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i48;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i18;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i19;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i59;
import 'package:kare_kyoushi/util/permission/permission_util.dart' as _i20;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i8;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i24;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i29;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart'
    as _i53;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart'
    as _i54;
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart'
    as _i55;
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart'
    as _i32;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i34;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i61;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i56;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i57;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i45;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i38;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i58;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i52;
import 'package:kare_kyoushi/viewmodel/permission/camera_permission_viewmodel.dart'
    as _i30;
import 'package:kare_kyoushi/viewmodel/permission/library_permission_viewmodel.dart'
    as _i37;
import 'package:kare_kyoushi/viewmodel/profile/edit_profile_viewmodel.dart'
    as _i44;
import 'package:kare_kyoushi/viewmodel/profile/profile_viewmodel.dart' as _i21;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i60;
import 'package:kare_kyoushi/webservice/character/character_service.dart'
    as _i33;
import 'package:kare_kyoushi/webservice/user/user_service.dart' as _i25;
import 'package:kare_kyoushi/webservice/user/user_webservice.dart' as _i26;
import 'package:kare_kyoushi/webservice/word/word_service.dart' as _i28;
import 'package:shared_preferences/shared_preferences.dart' as _i23;

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
    gh.lazySingleton<_i3.CacheControlling>(() => _i4.CacheController());
    gh.singleton<_i5.ConnectivityHelper>(
        () => registerModule.connectivityHelper());
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
    gh.lazySingleton<_i11.FirebaseFirestore>(
        () => registerModule.firebaseFireStore());
    gh.lazySingleton<_i12.FirebaseStorage>(
        () => registerModule.firebaseStorage());
    gh.lazySingleton<_i13.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i14.ImagePicker>(() => registerModule.imagePicker());
    gh.lazySingleton<_i15.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i6.DatabaseConnection>()));
    gh.lazySingleton<_i16.LoginRepository>(
        () => _i16.LoginRepository(gh<_i10.FirebaseAuth>()));
    gh.lazySingleton<_i17.MainNavigator>(
        () => _i17.MainNavigator(gh<_i8.ErrorUtil>()));
    gh.singleton<_i18.NetworkErrorInterceptor>(
        () => _i18.NetworkErrorInterceptor(gh<_i5.ConnectivityHelper>()));
    gh.singleton<_i19.NetworkLogInterceptor>(
        () => _i19.NetworkLogInterceptor());
    gh.lazySingleton<_i20.PermissionUtil>(() => _i20.PermissionUtil());
    gh.factory<_i21.ProfileViewModel>(
        () => _i21.ProfileViewModel(gh<_i17.MainNavigator>()));
    gh.lazySingleton<_i22.SecureStorage>(
        () => _i22.SecureStorage(gh<_i13.FlutterSecureStorage>()));
    await gh.singletonAsync<_i23.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i24.ThemeConfigUtil>(() => _i24.ThemeConfigUtil());
    gh.lazySingleton<_i25.UserService>(() => _i26.UserWebService(
          gh<_i11.FirebaseFirestore>(),
          gh<_i12.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i27.WordDaoStorage>(
        () => _i27.WordDaoStorage(gh<_i15.KKDatabase>()));
    gh.lazySingleton<_i28.WordService>(
        () => _i28.WordService(gh<_i7.DifficultyGradeMatcher>()));
    gh.factory<_i29.BaseScreenViewModel>(
        () => _i29.BaseScreenViewModel(gh<_i17.MainNavigator>()));
    gh.factory<_i30.CameraPermissionViewModel>(
        () => _i30.CameraPermissionViewModel(gh<_i17.MainNavigator>()));
    gh.lazySingleton<_i31.CharacterDaoStorage>(
        () => _i31.CharacterDaoStorage(gh<_i15.KKDatabase>()));
    gh.factory<_i32.CharacterListViewModel>(
        () => _i32.CharacterListViewModel(gh<_i17.MainNavigator>()));
    gh.lazySingleton<_i33.CharacterService>(
        () => _i33.CharacterService(gh<_i7.DifficultyGradeMatcher>()));
    gh.factory<_i34.DebugPlatformSelectorViewModel>(
        () => _i34.DebugPlatformSelectorViewModel(gh<_i17.MainNavigator>()));
    gh.lazySingleton<_i35.FireBaseAnalyticsRepository>(
        () => _i35.FireBaseAnalyticsRepository(gh<_i9.FirebaseAnalytics>()));
    gh.lazySingleton<_i36.ImagePickerUtil>(() => _i36.ImagePickerUtil(
          gh<_i17.MainNavigator>(),
          gh<_i14.ImagePicker>(),
          gh<_i20.PermissionUtil>(),
        ));
    gh.factory<_i37.LibraryPermissionViewModel>(
        () => _i37.LibraryPermissionViewModel(gh<_i17.MainNavigator>()));
    gh.factory<_i38.LicenseViewModel>(
        () => _i38.LicenseViewModel(gh<_i17.MainNavigator>()));
    gh.lazySingleton<_i5.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i23.SharedPreferences>()));
    gh.lazySingleton<_i5.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i5.SharedPreferenceStorage>(),
              gh<_i22.SecureStorage>(),
            ));
    gh.lazySingleton<_i39.UserRepository>(() => _i39.UserRepository(
          gh<_i25.UserService>(),
          gh<_i10.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i40.WordRepository>(() => _i40.WordRepository(
          gh<_i28.WordService>(),
          gh<_i27.WordDaoStorage>(),
        ));
    gh.lazySingleton<_i41.AuthStorage>(
        () => _i41.AuthStorage(gh<_i5.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i42.CharacterRepository>(() => _i42.CharacterRepository(
          gh<_i31.CharacterDaoStorage>(),
          gh<_i33.CharacterService>(),
        ));
    gh.lazySingleton<_i43.DebugRepository>(
        () => _i43.DebugRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.factory<_i44.EditProfileViewModel>(() => _i44.EditProfileViewModel(
          gh<_i39.UserRepository>(),
          gh<_i36.ImagePickerUtil>(),
          gh<_i17.MainNavigator>(),
        ));
    gh.factory<_i45.HomeViewModel>(() => _i45.HomeViewModel(
          gh<_i17.MainNavigator>(),
          gh<_i42.CharacterRepository>(),
        ));
    gh.lazySingleton<_i46.LocalStorage>(() => _i46.LocalStorage(
          gh<_i41.AuthStorage>(),
          gh<_i5.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i47.LocaleRepository>(
        () => _i47.LocaleRepository(gh<_i5.SharedPreferenceStorage>()));
    gh.singleton<_i48.NetworkAuthInterceptor>(
        () => _i48.NetworkAuthInterceptor(gh<_i41.AuthStorage>()));
    gh.lazySingleton<_i49.OnboardingNavigator>(() => _i49.OnboardingNavigator(
          gh<_i17.MainNavigator>(),
          gh<_i46.LocalStorage>(),
          gh<_i16.LoginRepository>(),
        ));
    gh.lazySingleton<_i50.RefreshRepository>(
        () => _i50.RefreshRepository(gh<_i41.AuthStorage>()));
    gh.lazySingleton<_i51.StartupHelper>(() => _i51.StartupHelper(
          gh<_i42.CharacterRepository>(),
          gh<_i40.WordRepository>(),
          gh<_i39.UserRepository>(),
        ));
    gh.factory<_i52.AnalyticsPermissionViewModel>(
        () => _i52.AnalyticsPermissionViewModel(
              gh<_i49.OnboardingNavigator>(),
              gh<_i46.LocalStorage>(),
            ));
    gh.factory<_i53.CharacterDetailListViewmodel>(() =>
        _i53.CharacterDetailListViewmodel(gh<_i42.CharacterRepository>()));
    gh.factory<_i54.CharacterDetailViewModel>(
        () => _i54.CharacterDetailViewModel(
              gh<_i17.MainNavigator>(),
              gh<_i27.WordDaoStorage>(),
              gh<_i42.CharacterRepository>(),
            ));
    gh.factory<_i55.CharacterGradeListViewModel>(
        () => _i55.CharacterGradeListViewModel(
              gh<_i17.MainNavigator>(),
              gh<_i42.CharacterRepository>(),
            ));
    gh.factory<_i56.DebugViewModel>(() => _i56.DebugViewModel(
          gh<_i43.DebugRepository>(),
          gh<_i17.MainNavigator>(),
          gh<_i15.KKDatabase>(),
          gh<_i46.LocalStorage>(),
        ));
    gh.lazySingleton<_i57.GlobalViewModel>(() => _i57.GlobalViewModel(
          gh<_i47.LocaleRepository>(),
          gh<_i43.DebugRepository>(),
          gh<_i46.LocalStorage>(),
          gh<_i24.ThemeConfigUtil>(),
        ));
    gh.factory<_i58.LoginViewModel>(() => _i58.LoginViewModel(
          gh<_i16.LoginRepository>(),
          gh<_i49.OnboardingNavigator>(),
          gh<_i51.StartupHelper>(),
        ));
    gh.singleton<_i59.NetworkRefreshInterceptor>(
        () => _i59.NetworkRefreshInterceptor(
              gh<_i41.AuthStorage>(),
              gh<_i50.RefreshRepository>(),
            ));
    gh.factory<_i60.SplashViewModel>(() => _i60.SplashViewModel(
          gh<_i46.LocalStorage>(),
          gh<_i49.OnboardingNavigator>(),
          gh<_i51.StartupHelper>(),
        ));
    gh.lazySingleton<_i5.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i19.NetworkLogInterceptor>(),
              gh<_i48.NetworkAuthInterceptor>(),
              gh<_i18.NetworkErrorInterceptor>(),
              gh<_i59.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i61.DebugThemeSelectorViewModel>(
        () => _i61.DebugThemeSelectorViewModel(
              gh<_i17.MainNavigator>(),
              gh<_i57.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i62.Dio>(
        () => registerModule.provideDio(gh<_i5.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i63.RegisterModule {}
