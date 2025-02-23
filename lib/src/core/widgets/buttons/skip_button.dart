import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.errigalWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: context.isTablet
          ? const EdgeInsets.symmetric(horizontal: 16, vertical: 8)
          : const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Text(
        AppStrings.skip,
        style: context.isTablet
            ? _theme.textTheme.titleLarge!.copyWith(
                fontWeight: FontThickness.medium, color: AppColors.black)
            : _theme.textTheme.titleSmall!.copyWith(
                fontWeight: FontThickness.medium, color: AppColors.black),
      ),
    );
  }
}
