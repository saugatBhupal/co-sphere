import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class NotificationMessage extends StatelessWidget {
  final String message;
  const NotificationMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      constraints: BoxConstraints(maxWidth: context.width * 0.7),
      decoration: const BoxDecoration(
        color: AppColors.genie,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8.8),
        child: Text(
          message,
          style: _textTheme.bodySmall!.copyWith(
              color: AppColors.black,
              fontWeight: FontThickness.regular,
              fontSize: context.isTablet ? 16 : 12),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
