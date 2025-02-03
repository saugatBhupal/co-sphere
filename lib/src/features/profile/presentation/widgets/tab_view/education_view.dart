import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/education_card.dart';

class EducationView extends StatelessWidget {
  final String uid;
  // final ProfileBloc profileBloc;

  const EducationView({
    super.key,
    required this.uid,
    // required this.profileBloc,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) =>
          sl<ProfileBloc>()..add(GetEducationByUserID(uid: uid)),
      child: Container(
        width: context.width,
        margin: const EdgeInsets.symmetric(horizontal: 14),
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          border: Border.all(width: 0.4, color: AppColors.plaster),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.education,
              style: _textTheme.bodyLarge!.copyWith(
                fontWeight: FontThickness.semiBold,
              ),
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is GetEducationSuccess &&
                    state.education.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.education.length,
                      itemBuilder: (context, index) {
                        final education = state.education[index];
                        return EducationCard(
                          education: education,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 24);
                      },
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            Center(
              child: MoreButton(
                title: "${AppStrings.add} ${AppStrings.more}",
                onPressed: () {
                  // showEditDialog(context: context, child: const EditEducation());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
