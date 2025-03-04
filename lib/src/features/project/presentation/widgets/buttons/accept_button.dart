import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/trash_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class AcceptButton extends StatelessWidget {
  final VoidCallback? onTap;
  const AcceptButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: context.isTablet ? 42 : 30,
        height: context.isTablet ? 42 : 30,
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
      ),
    );
  }
}
