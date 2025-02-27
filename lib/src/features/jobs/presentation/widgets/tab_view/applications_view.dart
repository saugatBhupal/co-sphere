import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:flutter/material.dart';

class ApplicationsView extends StatelessWidget {
  final List<Job> jobs;
  const ApplicationsView({super.key, required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: jobs.length,
          itemBuilder: (context, index) => JobApplicationCard(job: jobs[index]),
          separatorBuilder: (context, index) {
            return const SizedBox(height: 4);
          },
        ),
      ),
    );
  }
}
