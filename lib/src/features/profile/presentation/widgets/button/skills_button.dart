import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class SkillsButton extends StatelessWidget {
  final String name;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double fontSize;
  const SkillsButton({
    super.key,
    required this.name,
    this.padding,
    this.borderRadius,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.genie,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
      ),
      child: Text(
        name,
        style: _textTheme.bodySmall!.copyWith(
          color: AppColors.midnight,
          fontWeight: FontThickness.medium,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
