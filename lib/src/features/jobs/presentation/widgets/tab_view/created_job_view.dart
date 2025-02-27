import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatedJobView extends StatelessWidget {
  final String uid;
  const CreatedJobView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => sl<JobBloc>()..add(CreatedJobs(uid: uid)),
      child: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state is CreatedJobsFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          if (state is CreatedJobsLoading &&
              context.read<JobBloc>().createdJobs.isEmpty) {
            return const SizedBox.shrink();
          }
          if (context.read<JobBloc>().createdJobs.isNotEmpty) {
            List<Job> jobs = context.read<JobBloc>().createdJobs;
            return Scaffold(
              body: SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  itemBuilder: (context, index) =>
                      JobApplicationCard(job: jobs[index], uid: uid),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
            );
          }
          return Center(
            child: Text(
              "No Jobs Created",
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
            ),
          );
        },
      ),
    );
  }
}
