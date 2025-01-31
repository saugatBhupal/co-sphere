import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AuthenticationAppbar extends StatelessWidget {
  const AuthenticationAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.midnight,
          ),
        ),
        const Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.midnight,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: AppFonts.albertSans,
          ),
        )
      ],
    );
  }
}
