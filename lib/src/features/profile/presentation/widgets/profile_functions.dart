import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileFunctions extends StatelessWidget {
  const ProfileFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SvgPicture.asset(
              AppIcons.web,
              height: context.isTablet ? 26 : null,
            ),
            Text(
              AppStrings.links,
              style: _textTheme.labelLarge!.copyWith(
                  fontWeight: FontThickness.medium,
                  height: 1.8,
                  color: AppColors.grey,
                  fontSize: context.isTablet ? 14 : 10),
            ),
          ],
        ),
        const SizedBox(width: 26),
        Column(
          children: [
            SvgPicture.asset(
              AppIcons.like,
              height: context.isTablet ? 32 : null,
            ),
            Text(
              "121",
              style: _textTheme.labelLarge!.copyWith(
                fontWeight: FontThickness.medium,
                height: 1.8,
                color: AppColors.grey,
                fontSize: context.isTablet ? 14 : 10,
              ),
            ),
          ],
        ),
        const SizedBox(width: 26),
        Column(
          children: [
            SvgPicture.asset(
              AppIcons.chat,
              height: context.isTablet ? 32 : null,
              colorFilter:
                  const ColorFilter.mode(AppColors.midnight, BlendMode.srcIn),
            ),
            Text(
              AppStrings.chat,
              style: _textTheme.labelLarge!.copyWith(
                fontWeight: FontThickness.medium,
                height: 1.8,
                color: AppColors.grey,
                fontSize: context.isTablet ? 14 : 10,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
