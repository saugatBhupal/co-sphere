import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class LightRoundedButton extends StatelessWidget {
  final String title;
  final double fontSize;

  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;

  const LightRoundedButton({
    super.key,
    required this.title,
    this.fontSize = 18,
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
                const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.midnight,
                      fontWeight: FontThickness.medium,
                      fontSize: fontSize,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
