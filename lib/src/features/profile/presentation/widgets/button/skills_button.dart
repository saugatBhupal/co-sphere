import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class SkillsButton extends StatelessWidget {
  final String name;
  const SkillsButton({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: AppColors.genie,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Text(
        name,
        style: _textTheme.bodySmall!.copyWith(
          color: AppColors.midnight,
          fontWeight: FontThickness.medium,
        ),
      ),
    );
  }
}
