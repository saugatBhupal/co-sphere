import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/about_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/education_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/experience_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/history_view.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/tab_view/reviews_view.dart';
import 'package:flutter/material.dart';

class ProfileTabbar extends StatelessWidget {
  const ProfileTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: DefaultTabController(
        length: 5,
        child: Column(
          children: [
            TabBar(
              isScrollable: false,
              indicator: const BoxDecoration(),
              dividerHeight: 0,
              padding: const EdgeInsets.only(top: 8),
              tabAlignment: TabAlignment.center,
              unselectedLabelColor: AppColors.grey,
              labelStyle: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.midnight),
              labelPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 6),
              splashFactory: NoSplash.splashFactory,
              tabs: const [
                Tab(text: AppStrings.about),
                Tab(text: AppStrings.experience),
                Tab(text: AppStrings.education),
                Tab(text: AppStrings.history),
                Tab(text: AppStrings.reviews),
              ],
            ),
            SizedBox(
              height: context.height - 250,
              child: const TabBarView(
                children: [
                  AboutView(),
                  ExperienceView(),
                  EducationView(),
                  HistoryView(),
                  ReviewsView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
