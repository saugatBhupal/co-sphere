import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationFunctions extends StatelessWidget {
  const NotificationFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: const BoxDecoration(
        color: AppColors.satin,
        border: Border(
          top: BorderSide(color: AppColors.plaster, width: 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.plaster)),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 6.5),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.tick,
                    height: context.isTablet ? 26 : null,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    AppStrings.read,
                    style: _textTheme.bodySmall!.copyWith(
                        fontWeight: FontThickness.medium,
                        fontSize: context.isTablet ? 16 : 12,
                        letterSpacing: 0),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColors.garden,
                  borderRadius: BorderRadius.circular(8),
                  border:
                      Border.all(color: AppColors.pumpkin.withOpacity(0.2))),
              padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 6.5),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.trash,
                    height: context.isTablet ? 26 : null,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    AppStrings.clear,
                    style: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontThickness.medium,
                      letterSpacing: 0,
                      color: AppColors.pumpkin,
                      fontSize: context.isTablet ? 16 : 12,
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
