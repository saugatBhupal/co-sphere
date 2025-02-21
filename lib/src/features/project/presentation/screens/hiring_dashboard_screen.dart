import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/applicants_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/accept_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/reject_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/members_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HiringDashboardScreen extends StatelessWidget {
  final String projectId;
  const HiringDashboardScreen({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetProjectByID(projectId: projectId)),
      child: Scaffold(
        appBar: const CommonAppbar(
            title: "${AppStrings.project} ${AppStrings.details}"),
        body: SingleChildScrollView(
          child: BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              if (state is GetProjectLoading) {
                return const CircularProgressIndicator(
                    color: AppColors.midnight);
              }
              if (state is GetProjectFailed) {
                buildToast(toastType: ToastType.error, msg: state.message);
              }
              if (state is GetProjectByIdSuccess) {
                final Project project = state.project;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HiringHeader(
                        postedOn: project.createdAt,
                        projectName: project.projectName),
                    HiringDetailsBasics(
                      postedBy: project.postedBy,
                      salary: project.salary,
                      duration: project.duration,
                      postedOn: project.createdAt,
                      skills: project.skills,
                    ),
                    ApplicantsList(applicants: project.pendingApplicants),
                    const SizedBox(height: 8),
                    MembersList(
                      applicants: project.acceptedApplicants,
                      title: AppStrings.accepted,
                      functionWidget: const AcceptButton(),
                    ),
                    const SizedBox(height: 8),
                    MembersList(
                      applicants: project.rejectedApplicants,
                      title: AppStrings.rejected,
                      functionWidget: const RejectButton(),
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
