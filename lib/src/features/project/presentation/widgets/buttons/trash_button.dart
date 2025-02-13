import 'package:cosphere/src/core/constants/app_assets.dart';
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
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.casa,
        border: Border.all(width: 1, color: AppColors.red),
        borderRadius: BorderRadius.circular(4),
      ),
      child: SvgPicture.asset(AppIcons.trash),
    );
  }
}
