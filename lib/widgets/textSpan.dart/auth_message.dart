import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class AuthMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthMessage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: AppFonts.albertSans,
            fontSize: 44,
            fontWeight: FontWeight.w500,
            height: 1.2,
            letterSpacing: -1,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: const TextStyle(
            fontFamily: AppFonts.albertSans,
            fontSize: 17,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}
