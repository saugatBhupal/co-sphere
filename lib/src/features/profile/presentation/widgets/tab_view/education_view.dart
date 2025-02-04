import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/domain/entities/education.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/edit_pop_up.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_education.dart';
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
  final String email;
  const EducationView({
    super.key,
    required this.uid,
    required this.email,
  });
  static final _profileBloc = sl<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider<ProfileBloc>.value(
      value: _profileBloc..add(GetEducationByUserID(uid: uid)),
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
                // List<Education> educationLst = [];
                // if (context.read<ProfileBloc>().education.isNotEmpty) {
                //   // educationLst = List.from(state.education);
                // }
                // if (state is AddEducationSuccess) {
                //   context
                //       .read<ProfileBloc>()
                //       .add(GetEducationByUserID(uid: uid));
                // }
                if (context.read<ProfileBloc>().education.isNotEmpty) {
                  List<Education> educationLst =
                      context.read<ProfileBloc>().education;
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: educationLst.length,
                      itemBuilder: (context, index) {
                        final education = educationLst[index];
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
                  showEditDialog(
                      context: context,
                      child: EditEducation(email: email),
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
