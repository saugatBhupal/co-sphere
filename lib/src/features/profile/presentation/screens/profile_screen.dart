import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

import 'package:cosphere/src/features/profile/presentation/widgets/profile_badge.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_functions.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_image.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_skills.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.midnight,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(),
              SizedBox(height: 55),
              ProfileData(),
              ProfileBadge(),
              ProfileFunctions(),
              ProfileSkills(),
              ProfileTabbar(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            AppRoutes.editProfile,
          );
        },
        splashColor: AppColors.genie,
        shape: const CircleBorder(),
        elevation: 2,
        backgroundColor: AppColors.plaster,
        child: SvgPicture.asset(
          AppIcons.like,
        ),
      ),
    );
  }
}
