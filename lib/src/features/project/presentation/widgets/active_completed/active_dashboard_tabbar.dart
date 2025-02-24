import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/completed_task_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/members_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/tasks_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveDashboardTabbar extends StatelessWidget {
  final String status;
  final Project project;
  const ActiveDashboardTabbar(
      {super.key, required this.status, required this.project});

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
                  color: AppColors.dim.withOpacity(0.2),
                  fontSize: context.isTablet ? 16 : 12,
                ),
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                splashFactory: NoSplash.splashFactory,
                tabs: [
                  const Tab(text: AppStrings.members),
                  Tab(
                      text:
                          "${AppStrings.tasks}(${context.read<ProjectBloc>().activeTasks.length})"),
                  Tab(
                      text:
                          "${AppStrings.completed}(${context.read<ProjectBloc>().completedTasks.length})"),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    MembersView(members: project.members),
                    TasksView(
                        status: status,
                        projectId: project.id,
                        members: project.members),
                    const CompletedTaskView(),
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
