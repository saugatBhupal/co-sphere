// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
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
  final User user;
  const ProfileTabbar({
    super.key,
    required this.user,
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
                    color: AppColors.midnight,
                    fontSize: context.isTablet ? 16 : 14,
                  ),
                  unselectedLabelStyle: _textTheme.bodyLarge!.copyWith(
                      fontWeight: FontThickness.medium,
                      fontSize: context.isTablet ? 16 : 14,
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
                    ? AboutView(user: user)
                    : _getProfileModule(state.index, user),
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _getProfileModule(int index, User user) {
  switch (index) {
    case 0:
      return AboutView(user: user);
    case 1:
      return ExperienceView(uid: user.uid, email: user.email);
    case 2:
      return EducationView(uid: user.uid, email: user.email);
    case 3:
      return const HistoryView();
    case 4:
      return const ReviewsView();
    default:
      return AboutView(user: user);
  }
}
