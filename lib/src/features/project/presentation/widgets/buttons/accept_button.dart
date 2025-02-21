import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class AcceptButton extends StatelessWidget {
  const AcceptButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.green,
        shape: BoxShape.circle,
        border: Border.all(width: 1, color: AppColors.frog),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: SvgPicture.asset(
          AppIcons.check,
        ),
      ),
    );
  }
}
