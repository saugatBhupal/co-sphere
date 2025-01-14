import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

import 'package:cosphere/widgets/buttons/status_button.dart';
import 'package:flutter/material.dart';

class ExperienceCard extends StatelessWidget {
  final String position;
  final String organization;
  final String status;
  final String from;
  final String to;
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
        const CircleImageAvatar(
          radius: 26,
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
              ),
            ),
            Text(
              organization,
              style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontThickness.light,
                color: AppColors.grey,
              ),
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(text: "$from - $to ", style: _textTheme.labelLarge),
                  TextSpan(
                    text: "(${int.parse(to) - int.parse(from)} Year)",
                    style: _textTheme.labelLarge!.copyWith(
                      color: AppColors.midnight,
                    ),
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
