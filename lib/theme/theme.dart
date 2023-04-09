import 'package:flutter/material.dart';

class AppColor {
  static const Color backColor = Colors.white;
  static const Color mainColor = Color(0xFF600CAC);
  static const Color mainColorLight = Color(0xFF8E41D5);
  static const Color mainColorMegaLight = Color(0xFFE3CFF4);
  static const Color mainColorDark = Color(0xFF3C0470);
  static const Color green = Color(0xFF74E600);
  static const Color orange = Color(0xFFFFAD00);
  static const Color orangeLight = Color(0xFFFFC140);
  static const Color orangeMegaLight = Color(0xFFFFD273);
  static const Color greyDark = Color(0xFF999999);
  static const Color greyMedium = Color(0xFF8E8E8E);
  static const Color greyLight = Color(0xFFD9D9D9);
  static const Color greyMegaLight = Color(0xFFEAEAEA);
  static const Color error = Color(0xFFE95255);
}

ThemeData _themeLight = ThemeData.light();

ThemeData themeLight = _themeLight.copyWith(
  colorScheme: _schemeLight(_themeLight.colorScheme),
  appBarTheme: _appBarLight(_themeLight.appBarTheme),
  elevatedButtonTheme: ElevatedButtonThemeData(style: _elevButtonLight),
  primaryColorDark: AppColor.mainColor,
  textTheme: _textLight(_themeLight.textTheme),
  scaffoldBackgroundColor: AppColor.backColor,
  floatingActionButtonTheme:
      _floatButtonLight(_themeLight.floatingActionButtonTheme),
  inputDecorationTheme: _inputDecorLight(_themeLight.inputDecorationTheme),
  progressIndicatorTheme: _progressLight(_themeLight.progressIndicatorTheme),
);

ColorScheme _schemeLight(ColorScheme base) {
  return base.copyWith(
    error: AppColor.error,
    primary: AppColor.backColor,
    onPrimary: AppColor.mainColor,
    primaryContainer: AppColor.mainColor,
  );
}

TextTheme _textLight(TextTheme base) {
  return base.copyWith(
    headlineMedium: base.headlineMedium!.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      color: AppColor.backColor,
    ),
    headlineLarge: base.headlineMedium!.copyWith(
      fontSize: 36,
      fontWeight: FontWeight.w700,
      color: AppColor.backColor,
    ),
    bodyMedium: base.bodyMedium!.copyWith(
      fontSize: 14,
    ),
    labelMedium: base.labelMedium!.copyWith(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColor.mainColor,
    ),
  );
}

ProgressIndicatorThemeData _progressLight(ProgressIndicatorThemeData base) {
  return base.copyWith(
      linearTrackColor: AppColor.greyDark, color: AppColor.mainColor);
}

FloatingActionButtonThemeData _floatButtonLight(
    FloatingActionButtonThemeData base) {
  return base.copyWith(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    backgroundColor: AppColor.mainColorMegaLight,
    foregroundColor: AppColor.mainColor,
  );
}

AppBarTheme _appBarLight(AppBarTheme base) {
  return base.copyWith(
    backgroundColor: AppColor.backColor,
    centerTitle: false,
    foregroundColor: AppColor.mainColor,
    elevation: 0.0,
  );
}

ButtonStyle _elevButtonLight = ElevatedButton.styleFrom(
  shape: const StadiumBorder(),
  backgroundColor: AppColor.mainColor,
  foregroundColor: Colors.white,
  padding: const EdgeInsets.all(16),
);

InputDecorationTheme _inputDecorLight(InputDecorationTheme base) {
  return base.copyWith(
    labelStyle: const TextStyle(color: AppColor.greyMedium),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.greyMedium)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.mainColor)),
    errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: AppColor.error)),
    border: const OutlineInputBorder(),
  );
}
