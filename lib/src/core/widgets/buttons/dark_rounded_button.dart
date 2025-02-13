import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkRoundedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final double fontSize;
  final double? height;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final Function()? onPressed;
  const DarkRoundedButton(
      {super.key,
      required this.title,
      this.onPressed,
      this.fontSize = 18,
      this.padding,
      this.height,
      this.icon,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: height,
      child: Material(
        color: AppColors.midnight,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.winter,
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
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: isLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(
                            color: Colors.white,
                            animating: true,
                          ),
                        )
                      : Text(
                          title,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
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
