import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class AuthMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  const AuthMessage({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: _textTheme.displayLarge),
        const SizedBox(height: 12),
        Text(subtitle,
            style: context.isTablet
                ? _textTheme.headlineSmall!.copyWith(
                    fontWeight: FontThickness.regular,
                    color: AppColors.grey,
                  )
                : _textTheme.titleSmall!.copyWith(
                    fontWeight: FontThickness.regular,
                    fontSize: 17,
                  )),
      ],
    );
  }
}
