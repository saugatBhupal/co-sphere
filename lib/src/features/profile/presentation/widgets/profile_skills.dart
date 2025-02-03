import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/more_button.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/cards/edit_pop_up.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/edit_skills.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileSkills extends StatelessWidget {
  final String uid;
  final List<Skill> skills;
  const ProfileSkills({
    Key? key,
    required this.uid,
    required this.skills,
  }) : super(key: key);
  static final _profileBloc = sl<ProfileBloc>();

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider<ProfileBloc>.value(
      value: _profileBloc,
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          List<Skill> skillsLst = skills;
          if (state is AddSkillSuccess) {
            skillsLst = state.skills;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 14.0, horizontal: 6),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${AppStrings.skill} ",
                          style: _textTheme.bodyLarge!.copyWith(
                            fontWeight: FontThickness.medium,
                          ),
                        ),
                        TextSpan(
                          text: "(${skillsLst.length})",
                          style: _textTheme.bodyLarge!.copyWith(
                            color: AppColors.midnight,
                            fontWeight: FontThickness.semiBold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: context.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    border: Border.all(width: 0.6, color: AppColors.plaster),
                  ),
                  child: Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: [
                      ...List.generate(
                        skillsLst.length,
                        (index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: const BoxDecoration(
                              color: AppColors.genie,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.0)),
                            ),
                            child: Text(
                              skillsLst[index].name,
                              style: _textTheme.bodySmall!.copyWith(
                                color: AppColors.midnight,
                                fontWeight: FontThickness.medium,
                              ),
                            ),
                          );
                        },
                      ),
                      MoreButton(
                        title: "+ ${AppStrings.more}",
                        onPressed: () {
                          showEditDialog(
                            profileBloc: _profileBloc,
                            context: context,
                            child: EditSkills(
                              uid: uid,
                              skills: skillsLst,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
