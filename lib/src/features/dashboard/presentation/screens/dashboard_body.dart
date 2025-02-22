import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/created_by_me_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/assigned_card.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_functions.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_metrics.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';

class DashboardBody extends StatelessWidget {
  final User user;
  const DashboardBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              DashboardFunctions(user: user),
              const DashboardMetrics(),
              DashboardTitle(
                title: AppStrings.created,
                option: AppStrings.view,
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.createdProjects, arguments: user),
              ),
              CreatedByMeDashboard(uid: user.uid),
              const DashboardTitle(
                  title: AppStrings.assigned, option: AppStrings.view),
              SizedBox(
                width: context.width,
                height: context.height / 6.5,
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: context.width * 0.02,
                    childAspectRatio: 0.42,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return const AssignedCard();
                  },
                ),
              ),
              DashboardTitle(
                title: AppStrings.application,
                option: AppStrings.view,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.applications),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => const JobApplicationCard(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
