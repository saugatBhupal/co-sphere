import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:flutter/material.dart';

class CardsHeaderInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final String postedOn;
  final String? postedBy;
  const CardsHeaderInfo({
    super.key,
    this.postedOn = "10-11-2025",
    this.title = "Assignment Helper Needed",
    this.subtitle = "Posted on",
    this.postedBy,
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
          PlaceholderImage(title: title[0], imageUrl: postedBy),
          const SizedBox(width: 8), // Add spacing
          Expanded(
            // Ensures text does not overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: _textTheme.bodyLarge!.copyWith(
                    letterSpacing: 0.4,
                    height: 1,
                    fontSize: context.isTablet ? 16 : 14,
                  ),
                ),
                Text(
                  "$subtitle $postedOn",
                  style: _textTheme.labelSmall!
                      .copyWith(fontSize: context.isTablet ? 12 : 8),
                ),
              ],
            ),
          ),
          const Icon(Icons.more_horiz),
        ],
      ),
    );
  }
}
