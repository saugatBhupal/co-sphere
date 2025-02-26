import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/completed_dashboard_tabbar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedDashboardScreen extends StatelessWidget {
  final String projectId;
  const CompletedDashboardScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetProjectByID(projectId: projectId)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          final projectBloc = context.read<ProjectBloc>();
          final Project? project = projectBloc.project;

          if (state is GetProjectLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is GetProjectFailed) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (project != null) {
            return Scaffold(
              appBar: const CommonAppbar(
                  title: "${AppStrings.project} ${AppStrings.details}"),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProjectHeader(
                    postedBy: false,
                    status: project.status.toDatabaseValue(),
                    postedOn: project.createdAt,
                    projectName: project.projectName,
                    projectId: project.id,
                    members: project.members,
                  ),
                  ProjectDetailsBasics(
                      project: project, postedBy: false),
                  Expanded(
                      child: CompletedDashboardTabbar(
                          status: AppStrings.completed, project: project)),
                ],
              ),
            );
          }
          return const Center(child: Text("Unknown state"));
        },
      ),
    );
  }
}
