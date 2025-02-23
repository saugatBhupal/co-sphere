import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/review_card.dart';
import 'package:flutter/material.dart';

class ReviewsView extends StatelessWidget {
  const ReviewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      width: context.width,
      margin: const EdgeInsets.only(right: 14, left: 14, bottom: 14),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "${AppStrings.employer} ${AppStrings.reviews}",
            style: _textTheme.bodyLarge!.copyWith(
              fontWeight: FontThickness.semiBold,
              wordSpacing: 0,
                  fontSize: context.isTablet ? 18 : 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => const ReviewCard(
                  rating: 2,
                  organization: "Odoma",
                  review:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra pharetra ligula, nec mattis quam porta vitae nec mattis quam porta vitae.",
                ),
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 24);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
