import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:flutter/material.dart';

class CardsHeaderInfo extends StatelessWidget {
  final String title;
  final String postedOn;
  final String? postedBy;
  const CardsHeaderInfo({
    super.key,
    this.postedOn = "10-11-2025",
    this.title = "Assignment Helper Needed",
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
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PlaceholderImage(title: title[0], imageUrl: postedBy),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.width / 1.8,
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _textTheme.bodyLarge!.copyWith(
                        letterSpacing: 0.4,
                        height: 1,
                        fontSize: context.isTablet ? 18 : 14),
                  ),
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
