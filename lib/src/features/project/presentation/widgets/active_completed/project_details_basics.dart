import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_owner_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/trash_button.dart';
import 'package:flutter/material.dart';

class ProjectDetailsBasics extends StatelessWidget {
  final String status;
  const ProjectDetailsBasics({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 4),
      height: context.height / 5,
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 0.5, color: AppColors.plaster),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ProjectOwnerDetails(
                postedBy: User.initial(),
              ),
              SizedBox(width: 6),
              BudgetContainer(
                salary: Salary.initial(),
              ),
              Spacer(),
              DurationSpan(
                duration: DurationTime.initial().copyWith(from: 2, to: 5),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ProjectSkillsList(
              skills: [],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  AppStrings.visible,
                  style: _textTheme.labelLarge!.copyWith(letterSpacing: 0),
                ),
                const Spacer(),
                if (status == AppStrings.active) const TrashButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
