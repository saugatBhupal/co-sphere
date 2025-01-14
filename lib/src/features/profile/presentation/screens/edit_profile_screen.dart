import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_education.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_experience.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_images.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_intro.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_links.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_personal_details.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_skills.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.midnight,
        iconTheme: const IconThemeData(color: AppColors.white),
        centerTitle: true,
        title: Text(
          "${AppStrings.edit} ${AppStrings.profile}",
          style: _textTheme.titleLarge!.copyWith(
            color: AppColors.white,
            fontWeight: FontThickness.medium,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const EditImages(),
              _buildTitle(context, title: AppStrings.links),
              const EditLinks(),
              _buildTitle(context, title: AppStrings.skill),
              const EditSkills(),
              _buildTitle(context, title: AppStrings.personal),
              const EditPersonalDetails(),
              _buildTitle(context, title: AppStrings.intro),
              const EditIntro(),
              _buildTitle(context, title: AppStrings.education),
              const EditEducation(),
              _buildTitle(context, title: AppStrings.experience),
              const EditExperience(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildTitle(BuildContext context, {required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
    child: Text(
      title,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontWeight: FontThickness.medium, letterSpacing: 0, height: 1),
    ),
  );
}
