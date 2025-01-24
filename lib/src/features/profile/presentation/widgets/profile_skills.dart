import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:flutter/material.dart';

class ProfileSkills extends StatelessWidget {
  const ProfileSkills({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "${AppStrings.skill} ",
                    style: _textTheme.bodyLarge!.copyWith(
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
          Container(
            width: context.width,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              border: Border.all(width: 0.6, color: AppColors.plaster),
            ),
            child: Wrap(
              spacing: 6,
              runSpacing: 6,
              children: [
                ...List.generate(
                  5,
                  (index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration: const BoxDecoration(
                        color: AppColors.genie,
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Text(
                        "React JS",
                        style: _textTheme.bodySmall!.copyWith(
                          color: AppColors.midnight,
                          fontWeight: FontThickness.medium,
                        ),
                      ),
                    );
                  },
                ),
                const MoreButton(title: "+ ${AppStrings.more}"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
