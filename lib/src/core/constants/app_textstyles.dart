import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle _setStyle({
    Color? color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle labelSmall({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subLight,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle labelLarge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.light,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle bodySmall({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subLabel,
      fontWeight: FontThickness.light,
    );
  }

  static TextStyle bodyLarge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.label,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle titleSmall({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.details,
      fontWeight: FontThickness.medium,
    );
  }

  static TextStyle titleMedium({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.details,
      fontWeight: FontThickness.semiBold,
    );
  }

  static TextStyle titleLarge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.body,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle headlineSmall({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle headlineLarge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.title,
      fontWeight: FontThickness.semiBold,
    );
  }

  static TextStyle displaySmall({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.display,
      fontWeight: FontThickness.semiBold,
    );
  }

  static TextStyle displayLarge({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.headline,
      fontWeight: FontThickness.medium,
    );
  }
}
