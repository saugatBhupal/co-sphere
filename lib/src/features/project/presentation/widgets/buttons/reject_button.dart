import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.casa,
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColors.red),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 3),
        child: SvgPicture.asset(
          AppIcons.cross,
        ),
      ),
    );
  }
}
