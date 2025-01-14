import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/buttons/light_rounded_button.dart';
import 'package:flutter/material.dart';

class EditImages extends StatelessWidget {
  const EditImages({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 0.6, color: AppColors.plaster),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: context.height / 10,
                width: context.width,
                decoration: const BoxDecoration(
                  color: AppColors.midnight,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              const Positioned(
                bottom: -32,
                left: 20,
                child: CircleImageAvatar(radius: 34),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 34.0, bottom: 18, left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${AppStrings.your} ${AppStrings.photo}",
                  style: _textTheme.titleSmall!.copyWith(
                    fontWeight: FontThickness.medium,
                    color: AppColors.grey,
                    height: 1.2,
                  ),
                ),
                Text(
                  AppStrings.photoDisplay,
                  style: _textTheme.bodySmall!.copyWith(
                    color: AppColors.grey,
                    fontWeight: FontThickness.regular,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width / 3.8,
                      child: const LightRoundedButton(
                        title: AppStrings.upload,
                        fontSize: 13,
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      width: context.width / 5.8,
                      child: const DarkRoundedButton(
                        title: AppStrings.save,
                        fontSize: 13,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
