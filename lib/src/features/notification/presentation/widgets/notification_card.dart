import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final Widget? content;
  const NotificationCard({super.key, this.content});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 1),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          bottom: BorderSide(color: AppColors.plaster, width: 1.4),
        ),
      ),
      width: context.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleImageAvatar(radius: context.isTablet ? 24 : 16),
          const SizedBox(width: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Leslie Alexender ",
                          style: _textTheme.bodyLarge!.copyWith(
                              fontWeight: FontThickness.medium,
                              height: 1.2,
                              letterSpacing: 0,
                              fontSize: context.isTablet ? 18 : 14),
                        ),
                        TextSpan(
                          text: "messaged you",
                          style: _textTheme.bodyLarge!.copyWith(
                              color: AppColors.grey,
                              height: 1.2,
                              letterSpacing: 0,
                              fontSize: context.isTablet ? 18 : 14),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Friday 3:12 PM',
                    style: _textTheme.labelLarge!
                        .copyWith(fontSize: context.isTablet ? 12 : 10),
                  ),
                  if (content != null) ...[
                    const SizedBox(height: 12),
                    content!,
                  ],
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
