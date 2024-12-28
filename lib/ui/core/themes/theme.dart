import 'package:finance_ai/ui/core/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static const _textTheme = TextTheme(
    titleLarge: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
  );

  static final _inputDecorationTheme = InputDecorationTheme(
    hintStyle: const TextStyle(
      fontSize: 16,
      color: AppColors.dark25,
      fontWeight: FontWeight.normal,
    ),
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light20,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.light20,
        width: 1.0,
      ),
      borderRadius: BorderRadius.circular(16),
    ),
  );

  static final _filledButtonThemeData = FilledButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.light20;
        }
        return AppColors.violet100;
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    ),
  );

  static final _outlineButtonThemeData = OutlinedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return AppColors.light20;
        }
        return Colors.transparent;
      }),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      side: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return const BorderSide(color: AppColors.dark25);
        }
        return const BorderSide(
          color: AppColors.light20,
          width: 1.0,
        );
      }),
    ),
  );

  static const _progressIndicatorThemeData = ProgressIndicatorThemeData(
    color: AppColors.violet100,
  );

  static final _checkboxThemeData = CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.violet100;
      }
      return Colors.transparent;
    }),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.disabled)) {
        return AppColors.dark25;
      }
      return Colors.white;
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(
      color: AppColors.violet100,
      width: 2,
    ),
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: AppColors.lightColorScheme,
    textTheme: _textTheme,
    filledButtonTheme: _filledButtonThemeData,
    outlinedButtonTheme: _outlineButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    fontFamily: GoogleFonts.inter().fontFamily,
    checkboxTheme: _checkboxThemeData,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    progressIndicatorTheme: _progressIndicatorThemeData,
    extensions: const [],
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: AppColors.darkColorScheme,
    textTheme: _textTheme,
    filledButtonTheme: _filledButtonThemeData,
    outlinedButtonTheme: _outlineButtonThemeData,
    inputDecorationTheme: _inputDecorationTheme,
    fontFamily: GoogleFonts.inter().fontFamily,
    checkboxTheme: _checkboxThemeData,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
    ),
    progressIndicatorTheme: _progressIndicatorThemeData,
    extensions: const [],
  );
}
