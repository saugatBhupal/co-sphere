import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class RejectButton extends StatelessWidget {
  final VoidCallback? onTap;
  const RejectButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.casa,
          shape: BoxShape.circle,
          border: Border.all(width: 1, color: AppColors.red),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 2),
          child: SvgPicture.asset(
            AppIcons.cross,
          ),
        ),
      ),
    );
  }
}
