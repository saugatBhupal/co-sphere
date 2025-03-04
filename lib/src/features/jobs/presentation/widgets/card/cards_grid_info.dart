import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class CardsGridInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool border;
  final Color? color;
  final double? padding;
  const CardsGridInfo({
    super.key,
    required this.title,
    required this.subtitle,
    this.border = true,
    this.color,
    this.padding = 12,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(
        top: 2,
        left: padding ?? 12,
      ),
      decoration: BoxDecoration(
        border: Border(
          right: border
              ? const BorderSide(width: 1, color: AppColors.plaster)
              : BorderSide.none,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: _textTheme.bodyLarge!.copyWith(
              color: color ?? AppColors.black,
              height: 1.2,
              fontSize: context.isTablet ? 18 : 14,
              fontWeight: FontThickness.semiBold,
            ),
          ),
          Text(subtitle,
              style: _textTheme.bodySmall!.copyWith(
                fontSize: context.isTablet ? 13 : 11,
              )),
        ],
      ),
    );
  }
}
