import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class CardsHeaderInfo extends StatelessWidget {
  const CardsHeaderInfo({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleImageAvatar(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assignment Helper Needed",
                  style: _textTheme.bodyLarge!
                      .copyWith(letterSpacing: 0.4, height: 1),
                ),
                Text(
                  "Posted on 10-11-2025",
                  style: _textTheme.labelSmall,
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
