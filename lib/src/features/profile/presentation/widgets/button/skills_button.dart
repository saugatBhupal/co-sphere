import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class SkillsButton extends StatelessWidget {
  final String name;
  final EdgeInsets? padding;
  final double? borderRadius;
  final double? fontSize;
  const SkillsButton({
    super.key,
    required this.name,
    this.padding,
    this.borderRadius,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: context.isTablet ? 20 : 16,
              vertical: context.isTablet ? 12 : 8),
      decoration: BoxDecoration(
        color: AppColors.genie,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 8.0)),
      ),
      child: Text(
        name,
        style: _textTheme.bodySmall!.copyWith(
          color: AppColors.midnight,
          fontWeight: FontThickness.medium,
          fontSize: fontSize ?? (context.isTablet ? 16 : 12),
        ),
      ),
    );
  }
}
