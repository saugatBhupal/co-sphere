import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class FunctionButton extends StatelessWidget {
  final String icon;
  const FunctionButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.beluga,
        border: Border.all(width: 1, color: AppColors.plaster),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgPicture.asset(icon),
    );
  }
}
