import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/user_location_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:flutter/material.dart';

class JobDetailsBasics extends StatelessWidget {
  const JobDetailsBasics({super.key});

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
              UserLocationDetails(user: User.initial()),
              Spacer(),
              DurationSpan(
                  duration: DurationTime.initial().copyWith(from: 2, to: 8)),
            ],
          ),
          const SizedBox(height: 10),
          ProjectSkillsList(
            skills: [Skill.initial().copyWith(name: "flutter")],
          ),
        ],
      ),
    );
  }
}
