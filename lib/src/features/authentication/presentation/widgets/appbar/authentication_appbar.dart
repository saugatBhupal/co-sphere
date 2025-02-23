import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class AuthenticationAppbar extends StatelessWidget {
  const AuthenticationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_outlined,
            color: AppColors.midnight,
            size: context.isTablet ? 36 : 12,
          ),
        ),
        Text(
          AppStrings.appName,
          style: context.isTablet
              ? _textTheme.headlineLarge!.copyWith(
                  color: AppColors.midnight, fontWeight: FontThickness.bold)
              : _textTheme.titleLarge!.copyWith(
                  color: AppColors.midnight, fontWeight: FontThickness.bold),
        )
      ],
    );
  }
}
