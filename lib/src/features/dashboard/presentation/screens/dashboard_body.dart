import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/applied_job_list.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/applied_project_list.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/assigned_to_me_grid.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/sections/created_by_me_grid.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
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
              SizedBox(height: context.isTablet ? 4 : 16),
              DashboardFunctions(user: user),
              const DashboardMetrics(),
              CreatedByMeGrid(user: user),
              const DashboardTitle(
                  title: AppStrings.assigned, option: AppStrings.view),
              const AssignedToMeGrid(),
              AppliedJobList(user: user),
              AppliedProjectList(user: user),
            ],
          ),
        ),
      ),
    );
  }
}
