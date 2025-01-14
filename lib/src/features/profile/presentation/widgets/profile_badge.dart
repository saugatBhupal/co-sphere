import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        width: context.width / 2.60,
        height: context.mainHeight / 28,
        decoration: const BoxDecoration(
          color: AppColors.plaster,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppIcons.badge,
            ),
            const SizedBox(width: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "100% ",
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.midnight,
                      fontWeight: FontThickness.bold,
                    ),
                  ),
                  TextSpan(
                    text: AppStrings.job,
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.black,
                      fontWeight: FontThickness.regular,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
