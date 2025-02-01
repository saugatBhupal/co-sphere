import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class MoreButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const MoreButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          splashColor: AppColors.winter,
          borderRadius: BorderRadius.circular(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.plaster,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              title,
              style: _textTheme.bodySmall!.copyWith(
                color: AppColors.black,
                fontWeight: FontThickness.medium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
