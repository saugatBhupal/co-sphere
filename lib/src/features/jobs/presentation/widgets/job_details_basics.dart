import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/user_location_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:flutter/material.dart';

class JobDetailsBasics extends StatelessWidget {
  const JobDetailsBasics({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UserLocationDetails(user: User.initial()),
              Spacer(),
              DurationSpan(),
            ],
          ),
          SizedBox(height: 10),
          ProjectSkillsList(
            skills: [],
          ),
        ],
      ),
    );
  }
}
