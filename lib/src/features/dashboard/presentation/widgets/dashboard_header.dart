import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppStrings.hi} User,",
                style: _textTheme.headlineSmall,
              ),
              Text(AppStrings.welcomeBack,
                  style: _textTheme.headlineLarge!
                      .copyWith(color: AppColors.midnight)),
            ],
          ),
          const CircleImageAvatar(radius: 28),
        ],
      ),
    );
  }
}
