import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class NotificationContent extends StatelessWidget {
  final String message;
  const NotificationContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.snow,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.isTablet ? 14 : 12,
            vertical: context.isTablet ? 14 : 12.8),
        child: Text(
          message,
          style: _textTheme.bodySmall!.copyWith(
              color: AppColors.black, fontSize: context.isTablet ? 16 : 12),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
