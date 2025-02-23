import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class LightRoundedButton extends StatelessWidget {
  final String title;
  final double? fontSize;

  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

  const LightRoundedButton({
    super.key,
    required this.title,
    this.fontSize,
    this.padding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Material(
        color: AppColors.plaster,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.errigalWhite,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Container(
            padding: padding ??
                (context.isTablet
                    ? const EdgeInsets.symmetric(vertical: 10, horizontal: 16)
                    : const EdgeInsets.symmetric(vertical: 10, horizontal: 8)),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.midnight,
                      fontWeight: FontThickness.medium,
                      letterSpacing: 0,
                      fontSize: fontSize ?? (context.isTablet ? 22 : 18),
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
