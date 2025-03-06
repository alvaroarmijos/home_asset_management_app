import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_colors.dart';
import 'package:home_asset_management_app/app/ui/themes/app_text_theme.dart';

/// Contains the light theme used in App.
abstract class AppTheme {
  /// Determines base textStyle
  static final baseTextStyle = TextStyle(
    color: AppColors.textColor,
    fontFamilyFallback: Platform.isAndroid ? ['sans-serif', 'Roboto'] : null,
  );

  /// App light theme.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
      fontFamily: 'Roboto',
      textTheme: getTextTheme(baseTextStyle),
      primaryColor: AppColors.primaryColor,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shadowColor: const Color.fromRGBO(228, 235, 252, 0.25),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.light,
      ),
      buttonTheme: const ButtonThemeData(minWidth: double.infinity),
    );
  }
}
