import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:flutter/material.dart';

class SentTile extends StatelessWidget {
  const SentTile({
    super.key,
    required this.message,
    required this.sent,
    this.profileImage,
    this.username,
  });

  final String message;
  final String sent;
  final String? profileImage;
  final String? username;

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: context.width * 0.7),
                    decoration: const BoxDecoration(
                      color: AppColors.winter,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 12.8),
                      child: Text(
                        message,
                        style: _textTheme.bodySmall!.copyWith(
                            color: AppColors.white,
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
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: PlaceholderImage(
                title: username![0],
                imageUrl: profileImage,
                height: context.isTablet ? 46 : 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
