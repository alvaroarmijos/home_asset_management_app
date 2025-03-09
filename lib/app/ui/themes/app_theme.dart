import 'package:flutter/material.dart';
import 'package:home_asset_management_app/app/ui/app_colors.dart';
import 'package:home_asset_management_app/app/ui/app_spacing.dart';
import 'package:home_asset_management_app/app/ui/themes/app_text_theme.dart';

/// Contains the light theme used in App.
abstract class AppTheme {
  /// Determines base textStyle
  static const baseTextStyle = TextStyle(color: AppColors.textColor);

  /// Determines outline input border for input decoration
  static final outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(AppSpacing.space16),
    borderSide: BorderSide(
      color: AppColors.primaryColor.withValues(alpha: 0.1),
    ),
  );

  /// Returns the light theme
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
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryColor.withValues(alpha: 0.1),
        hintStyle: baseTextStyle.copyWith(fontSize: 14, color: Colors.grey),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.space12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSpacing.space16),
          ),
        ),
      ),
    );
  }
}
