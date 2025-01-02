import 'package:cosphere/core/constants/app_colors.dart';
import 'package:cosphere/core/constants/app_fonts.dart';
import 'package:cosphere/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class DarkRoundedButton extends StatelessWidget {
  final String title;
  final String? icon;
  final Function()? onPressed;
  const DarkRoundedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.only(bottom: 10),
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontFamily: AppFonts.albertSans,
                      fontSize: 20,
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
