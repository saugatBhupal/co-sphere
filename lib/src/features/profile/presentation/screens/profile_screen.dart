// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_badge.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_functions.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_image.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_skills.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_tabbar.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.midnight,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileImage(profileImage: user.profileImage ?? ''),
              const SizedBox(height: 55),
              ProfileData(
                  name: user.fullname, city: user.city, country: user.country),
              const ProfileBadge(),
              const ProfileFunctions(),
              const ProfileSkills(),
              const ProfileTabbar(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushNamed(AppRoutes.editProfile, arguments: user);
        },
        splashColor: AppColors.genie,
        shape: const CircleBorder(),
        elevation: 2,
        backgroundColor: AppColors.plaster,
        child: SvgPicture.asset(
          AppIcons.editUser,
        ),
      ),
    );
  }
}
