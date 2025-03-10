// coverage:ignore-file
import 'package:flutter/material.dart';

/// Returns the generic TextTheme used in App's Design System
TextTheme getTextTheme(TextStyle baseTextStyle) {
  return TextTheme(
    // ---------- Headlines ----------
    headlineLarge: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 30,
    ),
    headlineMedium: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 26,
    ),
    headlineSmall: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 22,
    ),
    // ---------- Titles ----------
    titleLarge: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    titleMedium: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    titleSmall: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    // ---------- Labels ----------
    labelLarge: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 18,
    ),
    labelMedium: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
    labelSmall: baseTextStyle.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    // ---------- Bodies ----------
    bodyLarge: baseTextStyle.copyWith(fontSize: 18),
    bodyMedium: baseTextStyle.copyWith(fontSize: 16),
    bodySmall: baseTextStyle.copyWith(fontSize: 14),
  );
}
