import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MemberReviewCard extends StatelessWidget {
  final String reviewId;
  final String projectId;
  const MemberReviewCard(
      {super.key, required this.reviewId, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetReviewById(reviewId: reviewId)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetReviewByIdFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetReviewByIdSuccess) {
            return IntrinsicHeight(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(
                    top: BorderSide(color: AppColors.plaster, width: 0.5),
                    bottom: BorderSide(color: AppColors.plaster, width: 0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                state.reviews.review,
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
                                          index < state.reviews.rating
                                              ? AppColors.midnight
                                              : AppColors.genie;
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
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
                                    state.reviews.reviewedBy.fullname,
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
