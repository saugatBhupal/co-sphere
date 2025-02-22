import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_header.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveDashboardScreen extends StatelessWidget {
  final String projectId;
  const ActiveDashboardScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetProjectByID(projectId: projectId)),
      child: Scaffold(
        appBar: const CommonAppbar(
            title: "${AppStrings.project} ${AppStrings.details}"),
        body: BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, state) {
            if (state is GetProjectLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is GetProjectByIdSuccess) {
              final project = state.project;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectHeader(
                    status: AppStrings.active,
                    postedOn: project.createdAt,
                    projectName: project.projectName,
                    projectId: project.id,
                  ),
                  ProjectDetailsBasics(
                    status: AppStrings.active,
                    project: project,
                  ),
                  Expanded(
                      child: ProjectTabbar(
                          status: AppStrings.active, project: project)),
                ],
              );
            }
            if (state is GetProjectFailed) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return const Center(child: Text("Unknown state"));
          },
        ),
      ),
    );
  }
}
