import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Text(
            "Sarina Magar",
            style: _textTheme.titleLarge!
                .copyWith(height: 1.2, fontWeight: FontThickness.medium),
          ),
          Text(
            "Kathmandu, Nepal",
            style: _textTheme.titleSmall!
                .copyWith(color: AppColors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
