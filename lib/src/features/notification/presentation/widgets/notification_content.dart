import 'package:cosphere/src/core/constants/app_colors.dart';
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
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12.8),
        child: Text(
          message,
          style: _textTheme.bodySmall!.copyWith(
            color: AppColors.black,
          ),
          softWrap: true,
          overflow: TextOverflow.visible,
        ),
      ),
    );
  }
}
