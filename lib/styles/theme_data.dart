import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:kare_kyoushi/styles/theme_colors.dart';
import 'package:kare_kyoushi/styles/theme_fonts.dart';

class KKThemeData {
  KKThemeData._();

  static final _darkThemeData = ThemeData(
    fontFamily: ThemeFonts.body,
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryContainer: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryContainer: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.backgroundGrey,
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.backgroundGrey,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: isInTest ? const FadeUpwardsPageTransitionsBuilder() : BaseThemeData.getCorrectPageTransitionBuilder(OsInfo.instance),
      },
    ),
  );

  static final _lightThemeData = _darkThemeData.copyWith();

  static ThemeData darkTheme(TargetPlatform? targetPlatform) {
    return _darkThemeData.copyWith(platform: targetPlatform);
  }

  static ThemeData lightTheme(TargetPlatform? targetPlatform) {
    return _lightThemeData.copyWith(platform: targetPlatform);
  }
}

class KKTextTheme {
  final TextStyle titleHuge;
  final TextStyle titleBig;
  final TextStyle titleNormal;
  final TextStyle titleSmall;

  final TextStyle titleListItem;

  final TextStyle labelButtonBig;
  final TextStyle labelButtonSmall;

  final TextStyle bodyNormal;
  final TextStyle bodySmall;
  final TextStyle bodyUltraSmall;
  final TextStyle infoBodySubHeader;
  final TextStyle bodyBig;

  final TextStyle titleHeader;
  final TextStyle titleSubHeader;

  final TextStyle copyBig;
  final TextStyle copyHuge;

  final TextStyle copyDefault;
  final TextStyle copySubtle;
  final TextStyle copyXtraSubtle;

  const KKTextTheme({
    required this.titleHuge,
    required this.titleBig,
    required this.titleNormal,
    required this.titleSmall,
    required this.titleListItem,
    required this.labelButtonBig,
    required this.labelButtonSmall,
    required this.bodyNormal,
    required this.bodySmall,
    required this.bodyUltraSmall,
    required this.infoBodySubHeader,
    required this.bodyBig,
    required this.titleHeader,
    required this.titleSubHeader,
    required this.copyBig,
    required this.copyHuge,
    required this.copyDefault,
    required this.copySubtle,
    required this.copyXtraSubtle,
  });
}

class KKTextThemeExceptions {
  const KKTextThemeExceptions();
}

class KKColorsTheme {
  final Color text;
  final Color inverseText;
  final Color errorText;
  final Color buttonTextDisabled;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color permissionScreenBackground;
  final Color inverseBackground;
  final Color disabled;
  final Color icon;
  final Color appBarAction;
  final Color inverseIcon;
  final Color inverseProgressIndicator;
  final Color shadow;
  final Color progressIndicator;
  final Color buttonColor;
  final Color buttonText;
  final Color inverseButtonText;
  final Color textButtonText;

  final Color bottomNavbarBackground;
  final Color bottomNavbarItemActive;
  final Color bottomNavbarItemInactive;

  final Color inputFieldFill;
  final Color inputFieldHint;
  final Color inputFieldBorderEnabled;
  final Color inputFieldBorderFocused;
  final Color inputFieldBorderIdle;
  final Color inputFieldCursor;

  final Color debugTitleBackground;

  // Accent
  final Color accent1;
  final Color accent2;
  final Color accent3;
  final Color accent4;
  final Color accent5;

  // Background
  final Color bgDefault;
  final Color bgCard;

  // Text
  final Color copySubtle;
  final Color copyXtraSubtle;
  final Color copyDefault;

  // Misc
  final Color button;
  final Color stroke;

  const KKColorsTheme({
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.permissionScreenBackground,
    required this.inverseBackground,
    required this.text,
    required this.inverseText,
    required this.errorText,
    required this.disabled,
    required this.icon,
    required this.appBarAction,
    required this.inverseIcon,
    required this.inverseProgressIndicator,
    required this.shadow,
    required this.progressIndicator,
    required this.buttonColor,
    required this.buttonText,
    required this.inverseButtonText,
    required this.buttonTextDisabled,
    required this.textButtonText,
    required this.bottomNavbarBackground,
    required this.bottomNavbarItemActive,
    required this.bottomNavbarItemInactive,
    required this.inputFieldFill,
    required this.inputFieldHint,
    required this.inputFieldBorderEnabled,
    required this.inputFieldBorderFocused,
    required this.inputFieldBorderIdle,
    required this.inputFieldCursor,
    required this.debugTitleBackground,
    required this.bgDefault,
    required this.bgCard,
    required this.copySubtle,
    required this.copyXtraSubtle,
    required this.copyDefault,
    required this.button,
    required this.accent1,
    required this.accent2,
    required this.accent3,
    required this.accent4,
    required this.accent5,
    required this.stroke,
  });
}

class KKTextThemes {
  final KKTextTheme coreTextTheme;
  final KKTextTheme subtleTextTheme;
  final KKTextTheme xtraSubtleTextTheme;
  final KKTextTheme inverseCoreTextTheme;
  final KKTextTheme accent1TextTheme;
  final KKTextTheme accent2TextTheme;
  final KKTextTheme accent3TextTheme;
  final KKTextTheme accent4TextTheme;
  final KKTextTheme accent5TextTheme;
  final KKTextTheme disabledTextTheme;

  KKTextThemes({
    required this.coreTextTheme,
    required this.subtleTextTheme,
    required this.xtraSubtleTextTheme,
    required this.inverseCoreTextTheme,
    required this.accent1TextTheme,
    required this.accent2TextTheme,
    required this.accent3TextTheme,
    required this.accent4TextTheme,
    required this.accent5TextTheme,
    required this.disabledTextTheme,
  });
}

enum KKThemeStyle {
  dark,
  light,
}

class KKTheme {
  final KKTextThemes textThemes;
  final KKColorsTheme colorsTheme;
  final bool isDarkTheme;

  bool get isLightTheme => !isDarkTheme;

  // ignore: unused_field
  static final _instanceDark = _fromColorTheme(
    isDarkTheme: true,
    colorTheme: const KKColorsTheme(
      text: ThemeColors.white,
      inverseText: ThemeColors.black,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.white,
      background: ThemeColors.black,
      permissionScreenBackground: ThemeColors.primary,
      inverseBackground: ThemeColors.white,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.white,
      appBarAction: ThemeColors.white,
      inverseIcon: ThemeColors.white,
      progressIndicator: ThemeColors.primary,
      inverseProgressIndicator: ThemeColors.white,
      shadow: ThemeColors.shadow,
      buttonText: ThemeColors.primary,
      inverseButtonText: ThemeColors.white,
      buttonTextDisabled: ThemeColors.lightGrey,
      buttonColor: ThemeColors.white,
      textButtonText: ThemeColors.white,
      bottomNavbarBackground: ThemeColors.primary,
      bottomNavbarItemActive: ThemeColors.white,
      bottomNavbarItemInactive: ThemeColors.white50,
      inputFieldFill: ThemeColors.black,
      inputFieldHint: ThemeColors.white50,
      inputFieldBorderEnabled: ThemeColors.white50,
      inputFieldBorderFocused: ThemeColors.white,
      inputFieldBorderIdle: ThemeColors.white50,
      inputFieldCursor: ThemeColors.accent,
      debugTitleBackground: ThemeColors.white20,
      bgDefault: ThemeColors.bgDefault,
      bgCard: ThemeColors.bgCard,
      copySubtle: ThemeColors.copySubtle,
      copyXtraSubtle: ThemeColors.copyXtraSubtle,
      copyDefault: ThemeColors.copyDefault,
      button: ThemeColors.button,
      accent1: ThemeColors.accent1,
      accent2: ThemeColors.accent2,
      accent3: ThemeColors.accent3,
      accent4: ThemeColors.accent4,
      accent5: ThemeColors.accent5,
      stroke: ThemeColors.stroke,
    ),
  );

  static final _instanceLight = _fromColorTheme(
    isDarkTheme: false,
    colorTheme: const KKColorsTheme(
      text: ThemeColors.black,
      inverseText: ThemeColors.white,
      errorText: ThemeColors.error,
      primary: ThemeColors.primary,
      accent: ThemeColors.accent,
      secondary: ThemeColors.black,
      background: ThemeColors.white,
      permissionScreenBackground: ThemeColors.white,
      inverseBackground: ThemeColors.white,
      inputFieldFill: ThemeColors.white,
      inputFieldHint: ThemeColors.mediumGrey,
      disabled: ThemeColors.disabledGrey,
      icon: ThemeColors.primary,
      appBarAction: ThemeColors.white,
      inverseIcon: ThemeColors.white,
      progressIndicator: ThemeColors.primary,
      inverseProgressIndicator: ThemeColors.white,
      shadow: ThemeColors.shadow,
      buttonText: ThemeColors.white,
      inverseButtonText: ThemeColors.primary,
      buttonTextDisabled: ThemeColors.lightGrey,
      buttonColor: ThemeColors.primary,
      textButtonText: ThemeColors.primary,
      bottomNavbarBackground: ThemeColors.white,
      bottomNavbarItemActive: ThemeColors.primary,
      bottomNavbarItemInactive: ThemeColors.mediumGrey,
      inputFieldBorderEnabled: ThemeColors.mediumGrey,
      inputFieldBorderFocused: ThemeColors.primary,
      inputFieldBorderIdle: ThemeColors.mediumGrey,
      inputFieldCursor: ThemeColors.accent,
      debugTitleBackground: ThemeColors.lightGrey,
      bgDefault: ThemeColors.bgDefault,
      bgCard: ThemeColors.bgCard,
      copySubtle: ThemeColors.copySubtle,
      copyXtraSubtle: ThemeColors.copyXtraSubtle,
      copyDefault: ThemeColors.copyDefault,
      button: ThemeColors.button,
      accent1: ThemeColors.accent1,
      accent2: ThemeColors.accent2,
      accent3: ThemeColors.accent3,
      accent4: ThemeColors.accent4,
      accent5: ThemeColors.accent5,
      stroke: ThemeColors.stroke,
    ),
  );

  static KKTheme _fromColorTheme({
    required KKColorsTheme colorTheme,
    required bool isDarkTheme,
  }) =>
      KKTheme._(
        isDarkTheme: isDarkTheme,
        colorsTheme: colorTheme,
        textThemes: KKTextThemes(
          disabledTextTheme: _getTextThemeFromColor(colorTheme.disabled),
          coreTextTheme: _getTextThemeFromColor(colorTheme.copyDefault),
          inverseCoreTextTheme: _getTextThemeFromColor(colorTheme.inverseText),
          accent1TextTheme: _getTextThemeFromColor(colorTheme.accent1),
          accent2TextTheme: _getTextThemeFromColor(colorTheme.accent2),
          accent3TextTheme: _getTextThemeFromColor(colorTheme.accent3),
          accent4TextTheme: _getTextThemeFromColor(colorTheme.accent4),
          accent5TextTheme: _getTextThemeFromColor(colorTheme.accent5),
          subtleTextTheme: _getTextThemeFromColor(colorTheme.copySubtle),
          xtraSubtleTextTheme: _getTextThemeFromColor(colorTheme.copyXtraSubtle),
        ),
      );

  static KKTextTheme _getTextThemeFromColor(Color color) => KKTextTheme(
        titleHuge: TextStyle(fontSize: 40, color: color, fontFamily: ThemeFonts.title, height: 1.2),
        titleBig: TextStyle(fontSize: 30, color: color, fontFamily: ThemeFonts.title, height: 1.2),
        titleNormal: TextStyle(fontSize: 24, color: color, fontFamily: ThemeFonts.title),
        titleSmall: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.title),
        titleListItem: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.title, fontWeight: FontWeight.bold),
        labelButtonBig: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        labelButtonSmall: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.button, fontWeight: FontWeight.bold),
        bodyBig: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.body),
        bodyNormal: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.body),
        bodySmall: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.body),
        bodyUltraSmall: TextStyle(fontSize: 12, color: color, fontFamily: ThemeFonts.body),
        infoBodySubHeader: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w600),
        titleHeader: TextStyle(fontSize: 24, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w700, height: 32 / 24),
        titleSubHeader: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w500, height: 28 / 16),
        copyBig: TextStyle(fontSize: 32, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w700, height: 28 / 32),
        copyHuge: TextStyle(fontSize: 64, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w700, height: 64 / 28),
        copyDefault: TextStyle(fontSize: 18, color: color, fontFamily: ThemeFonts.body, height: 28 / 18),
        copySubtle: TextStyle(fontSize: 16, color: color, fontFamily: ThemeFonts.body, height: 28 / 16),
        copyXtraSubtle: TextStyle(fontSize: 14, color: color, fontFamily: ThemeFonts.body, fontWeight: FontWeight.w400, height: 28 / 14),
      );

  const KKTheme._({
    required this.textThemes,
    required this.colorsTheme,
    required this.isDarkTheme,
  });

  static KKTheme of(BuildContext context, {bool forceDark = false, bool forceLight = false}) {
    return _instanceLight;
    /*
    if (forceDark) return _instanceDark;
    if (forceLight) return _instanceLight;
    final themeConfigUtil = getIt<ThemeConfigUtil>();

    final theme = themeConfigUtil.themeMode;
    if (theme == ThemeMode.dark) {
      return _instanceDark;
    } else if (theme == ThemeMode.light) {
      return _instanceLight;
    }
    final brightness = MediaQuery.of(context).platformBrightness;

    if (brightness == Brightness.dark) return _instanceDark;

    return _instanceLight;
  */
  }
}
