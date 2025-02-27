import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/accepted_members_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/applicants_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_header.dart';
import 'package:cosphere/src/features/project/presentation/widgets/rejected_members_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiringDashboardScreen extends StatelessWidget {
  final ProjectScreenArgs screenArgs;

  const HiringDashboardScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectBloc>()
        ..add(GetProjectByID(projectId: screenArgs.projectId)),
      child: Scaffold(
        appBar: const CommonAppbar(
            title: "${AppStrings.project} ${AppStrings.details}"),
        body: SingleChildScrollView(
          child: BlocListener<ProjectBloc, ProjectState>(
            listener: (context, state) {
              if (state is HireUserSuccess) {
                buildToast(
                    toastType: ToastType.success,
                    msg: "User Hired Successfully");
              }
              if (state is RejectUserSuccess) {
                buildToast(
                    toastType: ToastType.success,
                    msg: "User Rejected Successfully");
              }
              if (state is HireUserFailed) {
                buildToast(toastType: ToastType.error, msg: state.message);
              }
              if (state is GetProjectFailed) {
                buildToast(toastType: ToastType.error, msg: state.message);
              }
              if (state is FinishHireFailed) {
                buildToast(toastType: ToastType.error, msg: state.message);
              }
              if (state is FinishHireSuccess) {
                buildToast(toastType: ToastType.success, msg: state.message);
                Navigator.of(context).popAndPushNamed(AppRoutes.active,
                    arguments: ActiveScreensArgs(
                        projectId: screenArgs.projectId, userId: ""));
              }
            },
            child: BlocBuilder<ProjectBloc, ProjectState>(
              builder: (context, state) {
                final projectBloc = context.read<ProjectBloc>();
                final Project? project = projectBloc.project;
                if (project != null) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HiringHeader(
                        postedOn: project.createdAt,
                        projectName: project.projectName,
                        projectId: project.id,
                      ),
                      HiringDetailsBasics(
                        project: project,
                        uid: screenArgs.userId,
                      ),
                      if (projectBloc.applicants.isNotEmpty) ...[
                        ApplicantsList(projectId: project.id),
                        const SizedBox(height: 8),
                      ],
                      if (projectBloc.accepted.isNotEmpty) ...[
                        AcceptedMembersList(
                          applicants: projectBloc.accepted,
                          projectId: project.id,
                        ),
                        const SizedBox(height: 8),
                      ],
                      if (projectBloc.rejected.isNotEmpty) ...[
                        RejectedMemberList(
                          applicants: projectBloc.rejected,
                          projectId: project.id,
                        ),
                      ],
                    ],
                  );
                }

                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ),
      ),
    );
  }
}
