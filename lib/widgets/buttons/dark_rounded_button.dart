import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class DarkRoundedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final double fontSize;
  final double? height;

  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  const DarkRoundedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.fontSize = 18,
    this.padding,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: height,
      child: Material(
        color: AppColors.midnight,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.errigalWhite,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null)
                  Image.asset(
                    icon!,
                    height: 24.0,
                    width: 24.0,
                  ),
                Container(
                  padding: padding ??
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontThickness.medium,
                          fontSize: fontSize,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
