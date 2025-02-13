import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:flutter/material.dart';

class JobDetailsBasics extends StatelessWidget {
  const JobDetailsBasics({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    List<String> skills = [
      "Mobile Development",
      "React JS",
      "Node JS",
      "Mongo DB",
      "Mobile Development",
      "React JS",
      "Node JS",
      "Mongo DB",
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleImageAvatar(color: AppColors.midnight),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Harry Potter",
                      style: _textTheme.bodyLarge!
                          .copyWith(letterSpacing: 0.4, height: 1),
                    ),
                    Text(
                      "Kathmandu, Nepal",
                      style: _textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const FunctionButton(icon: AppIcons.calender),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3-6 Days",
                    style: _textTheme.bodySmall!.copyWith(
                        height: 1,
                        color: AppColors.black,
                        fontWeight: FontThickness.regular),
                  ),
                  Text(
                    AppStrings.duration,
                    style: _textTheme.labelLarge!.copyWith(height: 1),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...skills.map((skill) => Padding(
                        padding: const EdgeInsets.only(right: 6.0),
                        child: SkillsButton(name: skill),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
