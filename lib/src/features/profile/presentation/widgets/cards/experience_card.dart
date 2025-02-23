import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/utils/from_to_date.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final String position;
  final String organization;
  final String status;
  final DateTime from;
  final DateTime to;
  const ExperienceCard({
    super.key,
    required this.position,
    required this.organization,
    required this.status,
    required this.from,
    required this.to,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleImageAvatar(
          radius: context.isTablet ? 34 : 26,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              position,
              style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontThickness.semiBold,
                color: AppColors.midnight,
                height: 1,
                fontSize: context.isTablet ? 18 : 14,
              ),
            ),
            Text(
              organization,
              style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontThickness.light,
                color: AppColors.grey,
                fontSize: context.isTablet ? 18 : 14,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      text: "${formatMonth(from)} - ${formatMonth(to)}",
                      style: _textTheme.labelLarge!
                          .copyWith(fontSize: context.isTablet ? 14 : 10)),
                  TextSpan(
                    text: " (${calculateDuration(from, to)})",
                    style: _textTheme.labelLarge!.copyWith(
                        color: AppColors.midnight,
                        fontSize: context.isTablet ? 14 : 10),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        StatusButton(label: status)
      ],
    );
  }
}
