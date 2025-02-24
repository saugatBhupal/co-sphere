import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class CardsHeaderInfo extends StatelessWidget {
  final String title;
  final String postedOn;
  const CardsHeaderInfo({
    super.key,
    this.postedOn = "10-11-2025",
    this.title = "Assignment Helper Needed",
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(bottom: 12),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: AppColors.plaster),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleImageAvatar(
            color: AppColors.lemon,
            radius: context.isTablet ? 22 : null,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: _textTheme.bodyLarge!.copyWith(
                      letterSpacing: 0.4,
                      height: 1,
                      fontSize: context.isTablet ? 18 : 14),
                ),
                Text(
                  "Posted on $postedOn",
                  style: _textTheme.labelSmall!
                      .copyWith(fontSize: context.isTablet ? 12 : 8),
                ),
              ],
            ),
          ),
          const Spacer(),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
