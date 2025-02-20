import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:flutter/material.dart';

class DueDateSpan extends StatelessWidget {
  final String title;
  final String subtitle;
  const DueDateSpan(
      {super.key, this.title = "12 Oct 2025", required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const FunctionButton(icon: AppIcons.calender),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: _textTheme.bodySmall!.copyWith(
                  height: 1,
                  color: AppColors.black,
                  fontWeight: FontThickness.regular),
            ),
            Text(
              subtitle,
              style: _textTheme.labelLarge!.copyWith(height: 1),
            ),
          ],
        ),
      ],
    );
  }
}
