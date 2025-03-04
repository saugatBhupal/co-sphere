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
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_basics.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobDetailsScreen extends StatelessWidget {
  final JobScreenArgs screenArgs;

  const JobDetailsScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<JobBloc>()..add(GetJobById(id: screenArgs.jobId)),
      child: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state is GetJobByIdFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is ApplyToJobFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
          }
          if (state is ApplyToJobSuccess) {
            buildToast(
                toastType: ToastType.success,
                msg: "Applied to ${state.job.jobName}");
          }
          if (context.read<JobBloc>().job != Job.initial()) {
            final Job job = context.read<JobBloc>().job;
            final bool hasApplied = job.applicants
                .any((applicant) => applicant.user.uid == screenArgs.userId);

            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: const CommonAppbar(
                  title: "${AppStrings.job} ${AppStrings.details}"),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            JobDetailsHeader(
                              title: job.jobName,
                              postedOn: job.createdAt,
                              salary: job.salary,
                            ),
                            JobDetailsBasics(job: job),
                            const JobDetailsSection(
                              section: JobSection(
                                title: "What I Need?",
                                description:
                                    "We’re looking for a skilled and creative freelance developer...",
                              ),
                            ),
                            const JobDetailsSection(
                              section: JobSection(
                                title: "Platform",
                                lstDescription: ["iOS", "Android"],
                              ),
                            ),
                            const JobDetailsSection(
                              section: JobSection(
                                title: "Features",
                                lstDescription: [
                                  "Insect Identification: Upload or capture an image...",
                                  "Detailed Pest Information: Provide causes, harmful effects...",
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  if (job.postedBy.uid != screenArgs.userId)
                    SafeArea(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        color: AppColors.white,
                        child: hasApplied
                            ? LightRoundedButton(
                                fontSize: context.isTablet ? 20 : 16,
                                title:
                                    "${AppStrings.applied}: +${job.applicants.length} ${job.applicants.length == 1 ? AppStrings.applicant : AppStrings.applicants}",
                              )
                            : DarkRoundedButton(
                                title: AppStrings.apply,
                                onPressed: () {
                                  context.read<JobBloc>().add(ApplyToJob(
                                        dto: ApplyJobReqDto(
                                          userId: screenArgs.userId,
                                          jobId: job.id,
                                        ),
                                      ));
                                },
                              ),
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
