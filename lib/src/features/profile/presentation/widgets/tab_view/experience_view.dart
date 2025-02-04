// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/experience_mapper.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/experience_card.dart';

class ExperienceView extends StatelessWidget {
  final String uid;
  const ExperienceView({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<ProfileBloc>()..add(GetExperienceByUserID(uid: uid)),
      child: Container(
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${AppStrings.professional} ${AppStrings.overview}",
              style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontThickness.semiBold,
              ),
            ),
            const SizedBox(height: 4),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is GetProfileInfoLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                // if (state is GetProfileInfoFailed) {
                //   return Center(
                //     child: Text(
                //       "Failed to load experience",
                //       style: _textTheme.bodyLarge!.copyWith(color: Colors.red),
                //     ),
                //   );
                // }
                if (state is GetExperienceSuccess &&
                    state.dto.experience.isEmpty) {
                  return Center(
                    child: Text(
                      "No experience history",
                      style: _textTheme.bodyLarge!.copyWith(
                        color: AppColors.grey,
                        fontWeight: FontThickness.regular,
                      ),
                    ),
                  );
                }
                if (state is GetExperienceSuccess &&
                    state.dto.experience.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.dto.overview,
                        style: _textTheme.bodyLarge!.copyWith(
                          color: AppColors.silver,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 14),
                      Text(
                        AppStrings.experience,
                        style: _textTheme.bodyLarge!.copyWith(
                          fontWeight: FontThickness.semiBold,
                          color: AppColors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: state.dto.experience.length,
                          itemBuilder: (context, index) {
                            final experience =
                                state.dto.experience[index].toDomain();
                            print("Experoine convert $experience");
                            return ExperienceCard(
                              position: experience.position,
                              organization: experience.organization,
                              status: experience.status,
                              from: experience.from,
                              to: experience.to,
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 24);
                          },
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            /// More Button
            Center(
              child: MoreButton(
                title: "${AppStrings.add} ${AppStrings.more}",
                onPressed: () {
                  // showEditDialog(context: context, child: const EditExperience());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
