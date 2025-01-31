// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_images.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_intro.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_links.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_personal_details.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_skills.dart';

class EditProfileScreen extends StatelessWidget {
  final User user;
  const EditProfileScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    const _gap = SizedBox(height: 30);
    return Scaffold(
      appBar:
          const CommonAppbar(title: "${AppStrings.edit} ${AppStrings.profile}"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              EditImages(user: user),
              _buildTitle(context, title: AppStrings.links),
              const EditLinks(),
              _buildTitle(context, title: AppStrings.skill),
              const EditSkills(),
              _buildTitle(context, title: AppStrings.personal),
              const EditPersonalDetails(),
              _buildTitle(context, title: AppStrings.intro),
              const EditIntro(),
              _gap
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
