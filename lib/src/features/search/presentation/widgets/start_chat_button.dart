import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartChatButton extends StatelessWidget {
  const StartChatButton({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.chat,
            height: 16,
            width: 18,
            colorFilter:
                const ColorFilter.mode(AppColors.frog, BlendMode.srcIn),
          ),
          const SizedBox(width: 4),
          Text(
            AppStrings.start,
            style: _textTheme.labelSmall!.copyWith(
              fontWeight: FontThickness.semiBold,
              color: AppColors.frog,
            ),
          ),
        ],
      ),
    );
  }
}
