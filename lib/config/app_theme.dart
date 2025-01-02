import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  AppTheme._();

  static getAppTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppColors.black,
      ),
    );
    return ThemeData(
      fontFamily: AppFonts.albertSans,
      primaryColor: AppColors.midnight,
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.satin,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0.0,
        iconTheme: IconThemeData(color: AppColors.black),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.midnight,
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: const TextStyle(
          color: AppColors.dim,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          color: AppColors.grey,
          fontFamily: AppFonts.albertSans,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
