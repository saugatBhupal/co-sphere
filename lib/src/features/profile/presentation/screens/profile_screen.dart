import 'package:cosphere/src/features/profile/presentation/widgets/profile_badge.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_data.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_functions.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_image.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_skills.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/profile_tabbar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
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
    );
  }
}
