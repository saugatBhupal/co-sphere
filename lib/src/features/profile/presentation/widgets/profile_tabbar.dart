// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/about_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/education_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/experience_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/history_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/reviews_view.dart';

class ProfileTabbar extends StatelessWidget {
  final String uid;
  const ProfileTabbar({
    super.key,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocBuilder<ProfileBloc, ProfileState>(
      buildWhen: (previous, current) {
        return current is ProfileModuleChanged;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: DefaultTabController(
            length: 5,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {
                    context.read<ProfileBloc>().add(ChangeProfileModule(index));
                  },
                  isScrollable: false,
                  indicator: const BoxDecoration(),
                  dividerHeight: 0,
                  padding: const EdgeInsets.only(top: 8),
                  tabAlignment: TabAlignment.center,
                  unselectedLabelColor: AppColors.grey,
                  labelStyle: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontThickness.semiBold,
                      color: AppColors.midnight),
                  unselectedLabelStyle: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontThickness.medium,
                      color: AppColors.dim.withOpacity(0.2)),
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(text: AppStrings.about),
                    Tab(text: AppStrings.experience),
                    Tab(text: AppStrings.education),
                    Tab(text: AppStrings.history),
                    Tab(text: AppStrings.reviews),
                  ],
                ),
                state is! ProfileModuleChanged
                    ? const AboutView()
                    : _getProfileModule(state.index, uid),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _getProfileModule(int index, String uid) {
  switch (index) {
    case 0:
      return const AboutView();
    case 1:
      return ExperienceView(uid: uid);
    case 2:
      return EducationView(uid: uid);
    case 3:
      return const HistoryView();
    case 4:
      return const ReviewsView();
    default:
      return const AboutView();
  }
}
