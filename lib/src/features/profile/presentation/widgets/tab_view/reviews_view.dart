import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewsView extends StatelessWidget {
  final String uid;
  const ReviewsView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<ProfileBloc>()..add(GetReviewsByUser(uid: uid)),
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is GetReviewByUserFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is GetReviewByUserSuccess) {
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
                        itemCount: state.reviews.length,
                        itemBuilder: (context, index) => ReviewCard(
                          reviewId: state.reviews[index].id,
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
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
