import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/user_location_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:flutter/material.dart';

class JobDetailsBasics extends StatelessWidget {
  final Project project;
  const JobDetailsBasics({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserLocationDetails(user: project.postedBy),
              Spacer(),
              DurationSpan(
                  postedOn: project.createdAt, duration: project.duration),
            ],
          ),
          const SizedBox(height: 10),
          ProjectSkillsList(
            skills: project.skills,
          ),
        ],
      ),
    );
  }
}
