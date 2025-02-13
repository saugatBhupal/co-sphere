import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class BudgetContainer extends StatelessWidget {
  const BudgetContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
      child: Text(
        "रु 2000 - रु 7000",
        style: _textTheme.labelSmall!.copyWith(
          fontWeight: FontThickness.semiBold,
          color: AppColors.frog,
        ),
      ),
    );
  }
}
