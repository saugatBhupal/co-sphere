import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/light_rounded_button.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_section.dart';
import 'package:cosphere/src/features/project/data/dto/apply_project/apply_project_req_dto.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/project_explore_basic_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectScreenArgs screenArgs;

  const ProjectDetailsScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectBloc>()
        ..add(GetProjectByID(projectId: screenArgs.projectId)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetProjectFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is ApplyToProjectFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is ApplyToProjectSuccess) {
            buildToast(
                toastType: ToastType.success,
                msg: "Applied to ${state.project.projectName}");
          }
          if (context.read<ProjectBloc>().project != Project.initial()) {
            final Project project = context.read<ProjectBloc>().project;
            final int applicants = project.acceptedApplicants.length +
                project.pendingApplicants.length +
                project.rejectedApplicants.length;
            final bool hasApplied = project.acceptedApplicants.any(
                    (applicant) => applicant.user.uid == screenArgs.userId) ||
                project.pendingApplicants.any(
                    (applicant) => applicant.user.uid == screenArgs.userId) ||
                project.rejectedApplicants.any(
                    (applicant) => applicant.user.uid == screenArgs.userId) ||
                project.members
                    .any((member) => member.uid == screenArgs.userId);

            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: const CommonAppbar(
                  title: "${AppStrings.project} ${AppStrings.details}"),
              body: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JobDetailsHeader(
                              title: project.projectName,
                              postedOn: project.createdAt,
                              salary: project.salary,
                            ),
                            ProjectExploreBasicDetails(project: project),
                            JobDetailsSection(
                              section: JobSection(
                                title: AppStrings.description,
                                description: project.description,
                              ),
                            ),
                            const JobDetailsSection(
                              section: JobSection(
                                title: "Platform",
                                lstDescription: ["iOS", "Android"],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (project.postedBy.uid != screenArgs.userId)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      color: AppColors.white,
                      child: hasApplied
                          ? LightRoundedButton(
                              fontSize: context.isTablet ? 20 : 16,
                              title:
                                  "${AppStrings.applied}: +$applicants ${applicants == 1 ? AppStrings.applicant : AppStrings.applicants}",
                            )
                          : DarkRoundedButton(
                              title: AppStrings.apply,
                              onPressed: () {
                                context.read<ProjectBloc>().add(
                                      ApplyToProject(
                                        dto: ApplyProjectReqDto(
                                          userId: screenArgs.userId,
                                          projectId: project.id,
                                        ),
                                      ),
                                    );
                              },
                            ),
                    ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
