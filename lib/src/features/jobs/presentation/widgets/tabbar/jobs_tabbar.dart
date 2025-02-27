import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tab_view/applications_view.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tab_view/created_job_view.dart';
import 'package:flutter/material.dart';

class JobsTabbar extends StatelessWidget {
  final User user;
  final List<Job> appliedJobs;
  const JobsTabbar({super.key, required this.user, required this.appliedJobs});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                isScrollable: false,
                indicator: const BoxDecoration(),
                dividerHeight: 0,
                padding: const EdgeInsets.only(top: 4),
                tabAlignment: TabAlignment.center,
                unselectedLabelColor: AppColors.grey,
                labelStyle: _textTheme.bodySmall!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.midnight,
                  fontSize: context.isTablet ? 16 : 12,
                ),
                unselectedLabelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.medium,
                    fontSize: context.isTablet ? 16 : 12,
                    color: AppColors.dim.withOpacity(0.2)),
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                splashFactory: NoSplash.splashFactory,
                tabs: const [
                  Tab(text: AppStrings.application),
                  Tab(text: AppStrings.created),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    ApplicationsView(jobs: appliedJobs, uid: user.uid),
                    CreatedJobView(uid: user.uid),
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
