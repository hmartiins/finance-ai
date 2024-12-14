import 'package:flutter/material.dart';

abstract final class AppColors {
  static const dark25 = Color(0xFF7A7E80);
  static const dark50 = Color(0xFF464A4D);
  static const dark75 = Color(0xFF161719);
  static const dark100 = Color(0xFF0D0E0F);

  static const light20 = Color(0xFFE3E5E5);
  static const light40 = Color(0xFFF2F4F5);
  static const light60 = Color(0xFFF7F9FA);
  static const light80 = Color(0xFFFBFBFB);
  static const light100 = Color(0xFFFFFFFF);

  static const violet20 = Color(0xFFEEE5FF);
  static const violet40 = Color(0xFFD3BDFF);
  static const violet60 = Color(0xFFB18AFF);
  static const violet80 = Color(0xFF8F57FF);
  static const violet100 = Color(0xFF7F3DFF);

  static const red20 = Color(0xFFFDD5D7);
  static const red40 = Color(0xFFFDA2A9);
  static const red60 = Color(0xFFFD6F7A);
  static const red80 = Color(0xFFFD5662);
  static const red100 = Color(0xFFFD3C4A);

  static const green20 = Color(0xFFCFFAEA);
  static const green40 = Color(0xFF93EACA);
  static const green60 = Color(0xFF65D1AA);
  static const green80 = Color(0xFF2AB784);
  static const green100 = Color(0xFF00A86B);

  static const yellow20 = Color(0xFFFCEED4);
  static const yellow40 = Color(0xFFFCDDA1);
  static const yellow60 = Color(0xFFFCCC6F);
  static const yellow80 = Color(0xFFFCBB3C);
  static const yellow100 = Color(0xFFFCAC12);

  static const blue20 = Color(0xFFBDDCFF);
  static const blue40 = Color(0xFF8AC0FF);
  static const blue60 = Color(0xFF57A5FF);
  static const blue80 = Color(0xFF248AFF);
  static const blue100 = Color(0xFF0077FF);

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.dark100,
    onPrimary: AppColors.light100,
    secondary: AppColors.dark100,
    onSecondary: AppColors.light100,
    surface: Colors.white,
    onSurface: AppColors.dark100,
    error: Colors.white,
    onError: Colors.red,
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.light100,
    onPrimary: AppColors.dark100,
    secondary: AppColors.light100,
    onSecondary: AppColors.dark100,
    surface: AppColors.dark100,
    onSurface: Colors.white,
    error: Colors.black,
    onError: AppColors.red100,
  );
}
