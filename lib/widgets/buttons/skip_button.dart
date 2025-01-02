import 'package:cosphere/core/constants//app_colors.dart';
import 'package:cosphere/core/constants//app_fonts.dart';
import 'package:cosphere/core/constants//app_strings.dart';
import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.errigalWhite,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: const Text(
        AppStrings.skip,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: AppFonts.albertSans,
        ),
      ),
    );
  }
}
