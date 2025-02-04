import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/utils/from_to_date.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:flutter/material.dart';

class EducationCard extends StatelessWidget {
  final Education education;
  const EducationCard({
    super.key,
    required this.education,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const CircleImageAvatar(
          radius: 26,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                education.organization,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.midnight,
                  height: 1,
                ),
              ),
              Text(
                education.degree,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.light,
                  color: AppColors.grey,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "${formatMonth(education.from)} - ${formatMonth(education.to)}",
                        style: _textTheme.labelLarge),
                    TextSpan(
                      text:
                          " (${calculateDuration(education.from, education.to)})",
                      style: _textTheme.labelLarge!.copyWith(
                        color: AppColors.midnight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
