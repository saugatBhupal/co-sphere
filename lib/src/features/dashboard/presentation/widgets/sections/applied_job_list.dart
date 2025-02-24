import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';

class AppliedJobList extends StatelessWidget {
  final User user;
  const AppliedJobList({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<JobBloc>()..add(GetAppliedJob(uid: user.uid)),
      child: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state is GetAppliedJobFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          final jobList = context.watch<JobBloc>().appliedJobs;
          if (jobList.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              DashboardTitle(
                title: AppStrings.application,
                option: AppStrings.view,
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.jobApplications, arguments: jobList),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobList.length,
                  itemBuilder: (context, index) => JobApplicationCard(
                    job: jobList[index],
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
