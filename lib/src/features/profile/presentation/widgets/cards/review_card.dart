import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewCard extends StatelessWidget {
  final String reviewId;
  const ReviewCard({
    Key? key,
    required this.reviewId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<ProfileBloc>()..add(GetReviewById(reviewId: reviewId)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is GetReviewByIdFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetReviewByIdSuccess) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    state.review.review,
                    style: _textTheme.bodySmall!.copyWith(
                      color: AppColors.grey,
                      fontSize: context.isTablet ? 16 : 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          Color circleColor = index < state.review.rating
                              ? AppColors.midnight
                              : AppColors.genie;
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
                        state.review.reviewedBy.fullname,
                        style: _textTheme.labelLarge!.copyWith(
                          color: AppColors.grey,
                          fontWeight: FontThickness.medium,
                          fontSize: context.isTablet ? 14 : 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
