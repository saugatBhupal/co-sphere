import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class ReceivedTile extends StatelessWidget {
  const ReceivedTile({
    super.key,
    required this.message,
    required this.sent,
    this.profileImage,
  });

  final String message;
  final String sent;
  final String? profileImage;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: CircleImageAvatar(
                radius: context.isTablet ? 24 : 18,
                imageUrl: profileImage ?? '',
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: context.width * 0.7),
                  decoration: const BoxDecoration(
                    color: AppColors.genie,
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12.8),
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
                ),
                Text(
                  sent,
                  style: _textTheme.labelLarge!
                      .copyWith(fontSize: context.isTablet ? 12 : 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
