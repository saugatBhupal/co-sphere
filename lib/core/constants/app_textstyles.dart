import 'package:cosphere/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle _setStyle({
    Color? color,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight);
  }

  static TextStyle thinStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.label,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle extraLightStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.light,
      fontWeight: FontThickness.extraLight,
    );
  }

  static TextStyle lightStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.light,
      fontWeight: FontThickness.light,
    );
  }

  static TextStyle regularStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.details,
      fontWeight: FontThickness.regular,
    );
  }

  static TextStyle mediumStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.body,
      fontWeight: FontThickness.medium,
    );
  }

  static TextStyle semiBoldStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.medium,
    );
  }

  static TextStyle boldStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.subTitle,
      fontWeight: FontThickness.bold,
    );
  }

  static TextStyle blackStyle({Color? color}) {
    return _setStyle(
      color: color,
      fontSize: FontSize.title,
      fontWeight: FontThickness.extraBold,
    );
  }
}
