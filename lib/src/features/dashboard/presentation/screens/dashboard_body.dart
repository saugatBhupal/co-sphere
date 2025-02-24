import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/applied_project_list.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/assigned_to_me_grid.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/created_by_me_grid.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/project_application_card.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_functions.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_metrics.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              SizedBox(height: context.isTablet ? 4 : 16),
              DashboardFunctions(user: user),
              const DashboardMetrics(),
              CreatedByMeGrid(user: user),
              const DashboardTitle(
                  title: AppStrings.assigned, option: AppStrings.view),
              const AssignedToMeGrid(),
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
              AppliedProjectList(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
