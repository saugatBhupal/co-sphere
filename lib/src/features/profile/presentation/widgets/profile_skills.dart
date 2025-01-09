import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${AppStrings.skill} ",
                    style: _textTheme.bodyLarge!.copyWith(
                      color: AppColors.grey,
                      fontWeight: FontThickness.medium,
                    ),
                  ),
                  TextSpan(
                    text: "(5)",
                    style: _textTheme.bodyLarge!.copyWith(
                      color: AppColors.midnight,
                      fontWeight: FontThickness.semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Wrap(
            spacing: 8,
            runSpacing: 12,
            children: [
              ...List.generate(
                6,
                (index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: const BoxDecoration(
                      color: AppColors.genie,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Text(
                      "Flutter",
                      style: _textTheme.bodySmall!.copyWith(
                        color: AppColors.midnight,
                        fontWeight: FontThickness.semiBold,
                      ),
                    ),
                  );
                },
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.plaster,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  "+ ${AppStrings.more}",
                  style: _textTheme.bodySmall!.copyWith(
                    color: AppColors.black,
                    fontWeight: FontThickness.semiBold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
