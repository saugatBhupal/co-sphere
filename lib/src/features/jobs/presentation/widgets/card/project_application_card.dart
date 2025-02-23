import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProjectApplicationCard extends StatelessWidget {
  const ProjectApplicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List tag = ["React JS", "Flutter", "Mobile"];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1, color: AppColors.plaster),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleImageAvatar(
                  radius: context.isTablet ? 24 : 18, color: AppColors.lemon),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Designer",
                        style: _textTheme.bodyLarge!.copyWith(
                            letterSpacing: 0,
                            height: 1.2,
                            fontSize: context.isTablet ? 18 : 14)),
                    Text(
                      "Posted on 10-11-2025 by Saugat Bhupal Singh",
                      style: _textTheme.labelSmall!.copyWith(
                          height: 1,
                          letterSpacing: 0,
                          fontSize: context.isTablet ? 12 : 8),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: StatusButton(
                  label: "pending",
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  AppIcons.location,
                ),
                const SizedBox(width: 6),
                Text("Kathmandu, Nepal",
                    style: _textTheme.labelLarge!.copyWith(
                      color: AppColors.black,
                      fontSize: context.isTablet ? 14 : 10,
                    )),
              ],
            ),
          ),
          Row(
            children: [
              ...tag.map((item) => Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      item,
                      style: _textTheme.labelLarge!.copyWith(
                        fontSize: context.isTablet ? 14 : 10,
                      ),
                    ),
                  )),
              const Spacer(),
              Text(
                "${AppStrings.duration}: ",
                style: _textTheme.labelSmall!.copyWith(
                  fontSize: context.isTablet ? 14 : 8,
                ),
              ),
              Text(
                "3-6 ${AppStrings.days}",
                style: _textTheme.labelSmall!.copyWith(
                  color: AppColors.winter,
                  fontSize: context.isTablet ? 14 : 8,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
