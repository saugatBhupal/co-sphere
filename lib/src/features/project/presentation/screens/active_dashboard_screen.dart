import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_header.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/active_dashboard_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActiveDashboardScreen extends StatelessWidget {
  final ActiveScreensArgs screensArgs;
  const ActiveDashboardScreen({super.key, required this.screensArgs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectBloc>()
        ..add(GetProjectByID(projectId: screensArgs.projectId)),
      child: Scaffold(
        appBar: const CommonAppbar(
            title: "${AppStrings.project} ${AppStrings.details}"),
        body: BlocListener<ProjectBloc, ProjectState>(
          listener: (context, state) {
            if (state is CompleteTaskFailed) {
              buildToast(toastType: ToastType.error, msg: state.message);
            }
            if (state is CompleteTaskSuccess) {
              buildToast(
                  toastType: ToastType.success, msg: "Task Added Successfully");
            }
          },
          child: BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              final projectBloc = context.read<ProjectBloc>();
              final Project? project = projectBloc.project;
              bool postedBy = (project!.status == Status.active) &&
                  (screensArgs.userId == project.postedBy.uid);
              if (state is GetProjectLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (project != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProjectHeader(
                      postedBy: postedBy,
                      status: AppStrings.active,
                      postedOn: project.createdAt,
                      projectName: project.projectName,
                      projectId: project.id,
                      members: project.members,
                    ),
                    ProjectDetailsBasics(project: project, postedBy: postedBy),
                    Expanded(
                        child: ActiveDashboardTabbar(
                      status: AppStrings.active,
                      project: project,
                      // postedBy: postedBy,
                      screensArgs: screensArgs,
                    )),
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
      ),
    );
  }
}
