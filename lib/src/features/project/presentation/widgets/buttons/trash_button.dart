import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class TrashButton extends StatelessWidget {
  final EdgeInsets? padding;
  const TrashButton({
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: padding ??
          EdgeInsets.symmetric(
              horizontal: context.isTablet ? 12 : 8,
              vertical: context.isTablet ? 8 : 6),
      decoration: BoxDecoration(
        color: AppColors.casa,
        border: Border.all(width: 1, color: AppColors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgPicture.asset(
        AppIcons.trash,
        height: context.isTablet ? 20 : null,
      ),
    );
  }
}
