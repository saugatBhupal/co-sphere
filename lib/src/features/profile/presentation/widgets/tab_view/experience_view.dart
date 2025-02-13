import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/edit_pop_up.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_experience.dart';
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
  final String email;
  const ExperienceView({
    super.key,
    required this.uid,
    required this.email,
  });
  static final _profileBloc = sl<ProfileBloc>();
  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider<ProfileBloc>.value(
      value: _profileBloc..add(GetExperienceByUserID(uid: uid)),
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
                if (state is GetProfileInfoFailed) {
                  return Center(
                    child: Text(
                      "Failed to load experience",
                      style: _textTheme.bodyLarge!.copyWith(color: Colors.red),
                    ),
                  );
                }
                if (context.read<ProfileBloc>().experience.isEmpty) {
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
                if (context.read<ProfileBloc>().experience.isNotEmpty) {
                  List<Experience> experienceLst =
                      context.read<ProfileBloc>().experience;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.read<ProfileBloc>().overview,
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
                          itemCount: experienceLst.length,
                          itemBuilder: (context, index) {
                            final experience = experienceLst[index];
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
                  showEditDialog(
                      context: context,
                      child: EditExperience(email: email),
                      profileBloc: _profileBloc);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
