import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';

import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';

class ReviewCard extends StatelessWidget {
  final String review;
  final String organization;
  final int rating;
  const ReviewCard({
    Key? key,
    required this.review,
    required this.organization,
    required this.rating,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Text(
            review,
            style: _textTheme.bodySmall!.copyWith(
              color: AppColors.grey,
              height: 0,
              fontSize: context.isTablet ? 16 : 12,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 6.0),
          child: Column(
            children: [
              Row(
                children: List.generate(5, (index) {
                  Color circleColor =
                      index < rating ? AppColors.midnight : AppColors.genie;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: circleColor,
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 6),
              Text(
                organization,
                style: _textTheme.bodySmall!.copyWith(
                  color: AppColors.grey,
                  fontWeight: FontThickness.medium,
                  height: 0,
                  fontSize: context.isTablet ? 16 : 12,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
