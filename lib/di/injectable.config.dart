// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i12;
import 'package:dio/dio.dart' as _i62;
import 'package:drift/drift.dart' as _i7;
import 'package:firebase_analytics/firebase_analytics.dart' as _i10;
import 'package:firebase_auth/firebase_auth.dart' as _i11;
import 'package:firebase_storage/firebase_storage.dart' as _i13;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:icapps_architecture/icapps_architecture.dart' as _i6;
import 'package:image_picker/image_picker.dart' as _i15;
import 'package:injectable/injectable.dart' as _i2;
import 'package:kare_kyoushi/database/character/character_dao_storage.dart'
    as _i32;
import 'package:kare_kyoushi/database/kare_kyoushi_database.dart' as _i16;
import 'package:kare_kyoushi/database/word/word_dao_storage.dart' as _i28;
import 'package:kare_kyoushi/di/injectable.dart' as _i63;
import 'package:kare_kyoushi/navigator/main_navigator.dart' as _i18;
import 'package:kare_kyoushi/navigator/onboarding_navigator.dart' as _i50;
import 'package:kare_kyoushi/repository/analytics/firebase_analytics_repository.dart'
    as _i36;
import 'package:kare_kyoushi/repository/character/character_repository.dart'
    as _i43;
import 'package:kare_kyoushi/repository/debug/debug_repository.dart' as _i44;
import 'package:kare_kyoushi/repository/locale/locale_repository.dart' as _i48;
import 'package:kare_kyoushi/repository/login/login_repository.dart' as _i17;
import 'package:kare_kyoushi/repository/refresh/refresh_repository.dart'
    as _i51;
import 'package:kare_kyoushi/repository/secure_storage/auth/auth_storage.dart'
    as _i42;
import 'package:kare_kyoushi/repository/secure_storage/secure_storage.dart'
    as _i23;
import 'package:kare_kyoushi/repository/shared_prefs/local/local_storage.dart'
    as _i47;
import 'package:kare_kyoushi/repository/startup/startup_helper.dart' as _i52;
import 'package:kare_kyoushi/repository/user/user_repository.dart' as _i40;
import 'package:kare_kyoushi/repository/word/word_repository.dart' as _i41;
import 'package:kare_kyoushi/util/cache/cache_controller.dart' as _i4;
import 'package:kare_kyoushi/util/cache/cache_controlling.dart' as _i3;
import 'package:kare_kyoushi/util/difficulty_grade/diffulty_grade_matcher.dart'
    as _i8;
import 'package:kare_kyoushi/util/image/image_picker_util.dart' as _i37;
import 'package:kare_kyoushi/util/interceptor/network_auth_interceptor.dart'
    as _i49;
import 'package:kare_kyoushi/util/interceptor/network_error_interceptor.dart'
    as _i19;
import 'package:kare_kyoushi/util/interceptor/network_log_interceptor.dart'
    as _i20;
import 'package:kare_kyoushi/util/interceptor/network_refresh_interceptor.dart'
    as _i59;
import 'package:kare_kyoushi/util/permission/permission_util.dart' as _i21;
import 'package:kare_kyoushi/util/snackbar/error_util.dart' as _i9;
import 'package:kare_kyoushi/util/theme/theme_config.dart' as _i25;
import 'package:kare_kyoushi/viewmodel/base_screen/base_screen_viewmodel.dart'
    as _i30;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_list_viewmodel.dart'
    as _i5;
import 'package:kare_kyoushi/viewmodel/character_detail/character_detail_viewmodel.dart'
    as _i54;
import 'package:kare_kyoushi/viewmodel/character_grade_list/character_grade_list_viewmodel.dart'
    as _i55;
import 'package:kare_kyoushi/viewmodel/character_list/character_list_viewmodel.dart'
    as _i33;
import 'package:kare_kyoushi/viewmodel/debug/debug_platform_selector_viewmodel.dart'
    as _i35;
import 'package:kare_kyoushi/viewmodel/debug/debug_theme_selector_viewmodel.dart'
    as _i61;
import 'package:kare_kyoushi/viewmodel/debug/debug_viewmodel.dart' as _i56;
import 'package:kare_kyoushi/viewmodel/global/global_viewmodel.dart' as _i57;
import 'package:kare_kyoushi/viewmodel/home/home_viewmodel.dart' as _i46;
import 'package:kare_kyoushi/viewmodel/license/license_viewmodel.dart' as _i39;
import 'package:kare_kyoushi/viewmodel/login/login_viewmodel.dart' as _i58;
import 'package:kare_kyoushi/viewmodel/permission/analytics_permission_viewmodel.dart'
    as _i53;
import 'package:kare_kyoushi/viewmodel/permission/camera_permission_viewmodel.dart'
    as _i31;
import 'package:kare_kyoushi/viewmodel/permission/library_permission_viewmodel.dart'
    as _i38;
import 'package:kare_kyoushi/viewmodel/profile/edit_profile_viewmodel.dart'
    as _i45;
import 'package:kare_kyoushi/viewmodel/profile/profile_viewmodel.dart' as _i22;
import 'package:kare_kyoushi/viewmodel/splash/splash_viewmodel.dart' as _i60;
import 'package:kare_kyoushi/webservice/character/character_service.dart'
    as _i34;
import 'package:kare_kyoushi/webservice/user/user_service.dart' as _i26;
import 'package:kare_kyoushi/webservice/user/user_webservice.dart' as _i27;
import 'package:kare_kyoushi/webservice/word/word_service.dart' as _i29;
import 'package:shared_preferences/shared_preferences.dart' as _i24;

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
    gh.factory<_i5.CharacterDetailListViewmodel>(
        () => _i5.CharacterDetailListViewmodel());
    gh.singleton<_i6.ConnectivityHelper>(
        () => registerModule.connectivityHelper());
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
    gh.lazySingleton<_i12.FirebaseFirestore>(
        () => registerModule.firebaseFireStore());
    gh.lazySingleton<_i13.FirebaseStorage>(
        () => registerModule.firebaseStorage());
    gh.lazySingleton<_i14.FlutterSecureStorage>(() => registerModule.storage());
    gh.lazySingleton<_i15.ImagePicker>(() => registerModule.imagePicker());
    gh.lazySingleton<_i16.KKDatabase>(
        () => registerModule.provideKKDatabase(gh<_i7.DatabaseConnection>()));
    gh.lazySingleton<_i17.LoginRepository>(
        () => _i17.LoginRepository(gh<_i11.FirebaseAuth>()));
    gh.lazySingleton<_i18.MainNavigator>(
        () => _i18.MainNavigator(gh<_i9.ErrorUtil>()));
    gh.singleton<_i19.NetworkErrorInterceptor>(
        () => _i19.NetworkErrorInterceptor(gh<_i6.ConnectivityHelper>()));
    gh.singleton<_i20.NetworkLogInterceptor>(
        () => _i20.NetworkLogInterceptor());
    gh.lazySingleton<_i21.PermissionUtil>(() => _i21.PermissionUtil());
    gh.factory<_i22.ProfileViewModel>(
        () => _i22.ProfileViewModel(gh<_i18.MainNavigator>()));
    gh.lazySingleton<_i23.SecureStorage>(
        () => _i23.SecureStorage(gh<_i14.FlutterSecureStorage>()));
    await gh.singletonAsync<_i24.SharedPreferences>(
      () => registerModule.prefs(),
      preResolve: true,
    );
    gh.lazySingleton<_i25.ThemeConfigUtil>(() => _i25.ThemeConfigUtil());
    gh.lazySingleton<_i26.UserService>(() => _i27.UserWebService(
          gh<_i12.FirebaseFirestore>(),
          gh<_i13.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i28.WordDaoStorage>(
        () => _i28.WordDaoStorage(gh<_i16.KKDatabase>()));
    gh.lazySingleton<_i29.WordService>(
        () => _i29.WordService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i30.BaseScreenViewModel>(
        () => _i30.BaseScreenViewModel(gh<_i18.MainNavigator>()));
    gh.factory<_i31.CameraPermissionViewModel>(
        () => _i31.CameraPermissionViewModel(gh<_i18.MainNavigator>()));
    gh.lazySingleton<_i32.CharacterDaoStorage>(
        () => _i32.CharacterDaoStorage(gh<_i16.KKDatabase>()));
    gh.factory<_i33.CharacterListViewModel>(
        () => _i33.CharacterListViewModel(gh<_i18.MainNavigator>()));
    gh.lazySingleton<_i34.CharacterService>(
        () => _i34.CharacterService(gh<_i8.DifficultyGradeMatcher>()));
    gh.factory<_i35.DebugPlatformSelectorViewModel>(
        () => _i35.DebugPlatformSelectorViewModel(gh<_i18.MainNavigator>()));
    gh.lazySingleton<_i36.FireBaseAnalyticsRepository>(
        () => _i36.FireBaseAnalyticsRepository(gh<_i10.FirebaseAnalytics>()));
    gh.lazySingleton<_i37.ImagePickerUtil>(() => _i37.ImagePickerUtil(
          gh<_i18.MainNavigator>(),
          gh<_i15.ImagePicker>(),
          gh<_i21.PermissionUtil>(),
        ));
    gh.factory<_i38.LibraryPermissionViewModel>(
        () => _i38.LibraryPermissionViewModel(gh<_i18.MainNavigator>()));
    gh.factory<_i39.LicenseViewModel>(
        () => _i39.LicenseViewModel(gh<_i18.MainNavigator>()));
    gh.lazySingleton<_i6.SharedPreferenceStorage>(
        () => registerModule.sharedPreferences(gh<_i24.SharedPreferences>()));
    gh.lazySingleton<_i6.SimpleKeyValueStorage>(
        () => registerModule.keyValueStorage(
              gh<_i6.SharedPreferenceStorage>(),
              gh<_i23.SecureStorage>(),
            ));
    gh.lazySingleton<_i40.UserRepository>(() => _i40.UserRepository(
          gh<_i26.UserService>(),
          gh<_i11.FirebaseAuth>(),
        ));
    gh.lazySingleton<_i41.WordRepository>(() => _i41.WordRepository(
          gh<_i29.WordService>(),
          gh<_i28.WordDaoStorage>(),
        ));
    gh.lazySingleton<_i42.AuthStorage>(
        () => _i42.AuthStorage(gh<_i6.SimpleKeyValueStorage>()));
    gh.lazySingleton<_i43.CharacterRepository>(() => _i43.CharacterRepository(
          gh<_i32.CharacterDaoStorage>(),
          gh<_i34.CharacterService>(),
        ));
    gh.lazySingleton<_i44.DebugRepository>(
        () => _i44.DebugRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.factory<_i45.EditProfileViewModel>(() => _i45.EditProfileViewModel(
          gh<_i40.UserRepository>(),
          gh<_i37.ImagePickerUtil>(),
          gh<_i18.MainNavigator>(),
        ));
    gh.factory<_i46.HomeViewModel>(() => _i46.HomeViewModel(
          gh<_i18.MainNavigator>(),
          gh<_i43.CharacterRepository>(),
        ));
    gh.lazySingleton<_i47.LocalStorage>(() => _i47.LocalStorage(
          gh<_i42.AuthStorage>(),
          gh<_i6.SharedPreferenceStorage>(),
        ));
    gh.lazySingleton<_i48.LocaleRepository>(
        () => _i48.LocaleRepository(gh<_i6.SharedPreferenceStorage>()));
    gh.singleton<_i49.NetworkAuthInterceptor>(
        () => _i49.NetworkAuthInterceptor(gh<_i42.AuthStorage>()));
    gh.lazySingleton<_i50.OnboardingNavigator>(() => _i50.OnboardingNavigator(
          gh<_i18.MainNavigator>(),
          gh<_i47.LocalStorage>(),
          gh<_i17.LoginRepository>(),
        ));
    gh.lazySingleton<_i51.RefreshRepository>(
        () => _i51.RefreshRepository(gh<_i42.AuthStorage>()));
    gh.lazySingleton<_i52.StartupHelper>(() => _i52.StartupHelper(
          gh<_i43.CharacterRepository>(),
          gh<_i41.WordRepository>(),
          gh<_i40.UserRepository>(),
        ));
    gh.factory<_i53.AnalyticsPermissionViewModel>(
        () => _i53.AnalyticsPermissionViewModel(
              gh<_i50.OnboardingNavigator>(),
              gh<_i47.LocalStorage>(),
            ));
    gh.factory<_i54.CharacterDetailViewModel>(
        () => _i54.CharacterDetailViewModel(
              gh<_i18.MainNavigator>(),
              gh<_i28.WordDaoStorage>(),
              gh<_i43.CharacterRepository>(),
            ));
    gh.factory<_i55.CharacterGradeListViewModel>(
        () => _i55.CharacterGradeListViewModel(
              gh<_i18.MainNavigator>(),
              gh<_i43.CharacterRepository>(),
            ));
    gh.factory<_i56.DebugViewModel>(() => _i56.DebugViewModel(
          gh<_i44.DebugRepository>(),
          gh<_i18.MainNavigator>(),
          gh<_i16.KKDatabase>(),
          gh<_i47.LocalStorage>(),
        ));
    gh.lazySingleton<_i57.GlobalViewModel>(() => _i57.GlobalViewModel(
          gh<_i48.LocaleRepository>(),
          gh<_i44.DebugRepository>(),
          gh<_i47.LocalStorage>(),
          gh<_i25.ThemeConfigUtil>(),
        ));
    gh.factory<_i58.LoginViewModel>(() => _i58.LoginViewModel(
          gh<_i17.LoginRepository>(),
          gh<_i50.OnboardingNavigator>(),
          gh<_i52.StartupHelper>(),
        ));
    gh.singleton<_i59.NetworkRefreshInterceptor>(
        () => _i59.NetworkRefreshInterceptor(
              gh<_i42.AuthStorage>(),
              gh<_i51.RefreshRepository>(),
            ));
    gh.factory<_i60.SplashViewModel>(() => _i60.SplashViewModel(
          gh<_i47.LocalStorage>(),
          gh<_i50.OnboardingNavigator>(),
          gh<_i52.StartupHelper>(),
        ));
    gh.lazySingleton<_i6.CombiningSmartInterceptor>(
        () => registerModule.provideCombiningSmartInterceptor(
              gh<_i20.NetworkLogInterceptor>(),
              gh<_i49.NetworkAuthInterceptor>(),
              gh<_i19.NetworkErrorInterceptor>(),
              gh<_i59.NetworkRefreshInterceptor>(),
            ));
    gh.factory<_i61.DebugThemeSelectorViewModel>(
        () => _i61.DebugThemeSelectorViewModel(
              gh<_i18.MainNavigator>(),
              gh<_i57.GlobalViewModel>(),
            ));
    gh.lazySingleton<_i62.Dio>(
        () => registerModule.provideDio(gh<_i6.CombiningSmartInterceptor>()));
    return this;
  }
}

class _$RegisterModule extends _i63.RegisterModule {}
