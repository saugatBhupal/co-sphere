import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class FunctionButton extends StatelessWidget {
  final String icon;
  final String? title;
  final Function()? onPressed;
  final EdgeInsets? padding;
  const FunctionButton({
    super.key,
    required this.icon,
    this.title,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: padding ??
            EdgeInsets.symmetric(
                horizontal: context.isTablet ? 12 : 8,
                vertical: context.isTablet ? 8 : 6),
        decoration: BoxDecoration(
          color: AppColors.beluga,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              height: context.isTablet ? 20 : null,
            ),
            if (title != null) ...[
              const SizedBox(width: 6),
              Text(
                title!,
                style: _textTheme.labelLarge!.copyWith(
                  color: AppColors.black,
                  fontWeight: FontThickness.semiBold,
                  fontSize: context.isTablet ? 14 : 10,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
