import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';

import 'package:flutter/material.dart';

class StatusButton extends StatelessWidget {
  final String label;
  const StatusButton({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    String formattedLabel = label[0].toUpperCase() + label.substring(1);

    Color background;
    Color foreground;
    switch (formattedLabel) {
      case "Pending":
      case "Intern":
        background = AppColors.orange;
        foreground = AppColors.pumpkin;
        break;
      case "Rejected":
      case "Delayed":
      case "Associate":
        background = AppColors.casa;
        foreground = AppColors.red;
        break;
      case "Active":
      case "Junior":
      case "OnTime":
        background = AppColors.green;
        foreground = AppColors.frog;
        break;
      case "Mid":
        background = AppColors.calm;
        foreground = AppColors.frog;
        break;
      case "Senior":
      case "Early":
        background = AppColors.genie;
        foreground = AppColors.winter;
        break;
      default:
        background = AppColors.black;
        foreground = AppColors.pumpkin;
    }

    return Container(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6.5),
      child: Text(
        formattedLabel,
        style: _theme.textTheme.labelLarge!.copyWith(
          fontWeight: FontThickness.medium,
          color: foreground,
        ),
      ),
    );
  }
}
