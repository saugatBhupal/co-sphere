import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DashboardTitle extends StatelessWidget {
  final String title;
  final String? option;
  const DashboardTitle({super.key, required this.title, this.option});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 26, bottom: 10, left: 20, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
          ),
          if (option != null)
            Text(
              option!,
              style: _textTheme.bodySmall!.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.silver),
            ),
        ],
      ),
    );
  }
}
