import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(top: 26),
      child: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.satin,
        foregroundColor: AppColors.satin,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${AppStrings.hi} User,",
                      style: _textTheme.headlineSmall!.copyWith(height: 1.2),
                    ),
                    Text(
                      AppStrings.welcomeBack,
                      style: _textTheme.headlineLarge!
                          .copyWith(color: AppColors.midnight),
                    ),
                  ],
                ),
              ),
              const CircleImageAvatar(radius: 26),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(95);
}
