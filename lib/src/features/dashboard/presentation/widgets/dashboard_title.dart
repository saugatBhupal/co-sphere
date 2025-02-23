import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class DashboardTitle extends StatelessWidget {
  final String title;
  final String? option;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  const DashboardTitle({
    super.key,
    required this.title,
    this.option,
    this.onPressed,
    this.padding,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: padding ??
          const EdgeInsets.only(top: 26, bottom: 10, left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: fontSize ?? (context.isTablet ? 18 : 14)),
          ),
          if (option != null)
            GestureDetector(
              onTap: onPressed,
              child: Text(
                option!,
                style: _textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: context.isTablet ? 14 : 10,
                  color: AppColors.silver,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
