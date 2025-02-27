import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/search/presentation/widgets/tabbar/jobs_search.dart';
import 'package:cosphere/src/features/search/presentation/widgets/tabbar/projects_search_card.dart';
import 'package:cosphere/src/features/search/presentation/widgets/tabbar/user_search.dart';

class SearchResultsTabbar extends StatelessWidget {
  final String query;
  final String uid;
  const SearchResultsTabbar({
    super.key,
    required this.query,
    required this.uid,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {},
                isScrollable: false,
                indicator: const BoxDecoration(),
                dividerHeight: 0,
                tabAlignment: TabAlignment.center,
                unselectedLabelColor: AppColors.grey,
                labelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.semiBold,
                    fontSize: context.isTablet ? 16 : 12,
                    color: AppColors.midnight),
                unselectedLabelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.medium,
                    fontSize: context.isTablet ? 16 : 12,
                    color: AppColors.dim.withOpacity(0.2)),
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                splashFactory: NoSplash.splashFactory,
                tabs: const [
                  Tab(text: AppStrings.users),
                  Tab(text: AppStrings.job),
                  Tab(text: AppStrings.project),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    UserSearch(query: query),
                    JobsSearch(query: query),
                    ProjectsSearch(query: query, uid: uid),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
