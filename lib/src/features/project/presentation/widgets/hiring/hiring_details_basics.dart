import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/user_location_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/trash_button.dart';
import 'package:flutter/material.dart';

class HiringDetailsBasics extends StatelessWidget {
  final Project project;
  final String uid;
  const HiringDetailsBasics(
      {super.key, required this.project, required this.uid});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.projectDetails,
          arguments: ProjectScreenArgs(projectId: project.id, userId: uid)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: context.height / 5,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 0.5, color: AppColors.plaster),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                UserLocationDetails(user: project.postedBy),
                if (project.salary != Salary.initial()) ...[
                  const SizedBox(width: 6),
                  BudgetContainer(
                    salary: project.salary,
                  ),
                ],
                const Spacer(),
                DurationSpan(
                    postedOn: project.createdAt, duration: project.duration),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ProjectSkillsList(skills: project.skills),
            ),
            const Expanded(
              child: Row(
                children: [
                  FunctionButton(
                    icon: AppIcons.edit,
                    title: "${AppStrings.edit} ${AppStrings.details}",
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                  Spacer(),
                  FunctionButton(icon: AppIcons.share),
                  SizedBox(width: 12),
                  TrashButton(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
