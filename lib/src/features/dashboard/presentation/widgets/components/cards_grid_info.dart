import 'package:cosphere/src/core/constants/app_colors.dart';
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
            style: _textTheme.titleMedium!
                .copyWith(color: color ?? AppColors.black, height: 1.2),
          ),
          Text(subtitle, style: _textTheme.bodySmall),
        ],
      ),
    );
  }
}
