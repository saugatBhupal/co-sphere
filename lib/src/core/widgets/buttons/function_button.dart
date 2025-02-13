import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class FunctionButton extends StatelessWidget {
  final String icon;
  final String? title;
  final EdgeInsets? padding;
  const FunctionButton({
    super.key,
    required this.icon,
    this.title,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.beluga,
        border: Border.all(width: 1, color: AppColors.plaster),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          if (title != null) ...[
            const SizedBox(width: 6),
            Text(
              title!,
              style: _textTheme.labelLarge!.copyWith(
                color: AppColors.black,
                fontWeight: FontThickness.semiBold,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
