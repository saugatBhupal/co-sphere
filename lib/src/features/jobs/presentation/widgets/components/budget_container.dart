import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:flutter/material.dart';

class BudgetContainer extends StatelessWidget {
  final Salary salary;
  const BudgetContainer({super.key, required this.salary});

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
        "रु ${salary.min} - रु ${salary.max}",
        style: _textTheme.labelSmall!.copyWith(
          fontWeight: FontThickness.semiBold,
          color: AppColors.frog,
        ),
      ),
    );
  }
}
