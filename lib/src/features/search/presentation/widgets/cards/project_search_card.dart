import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/due_date_span.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:flutter_svg/svg.dart';

class ProjectSearchCard extends StatelessWidget {
  final Project project;
  const ProjectSearchCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List<String> tag = [project.site, "Full Time", "Company"];

    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.hiring),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: AppColors.frog,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project.companyName.isNotEmpty == true
                            ? project.companyName
                            : project.postedBy.fullname,
                        style: _textTheme.labelLarge,
                      ),
                      Text(project.projectName,
                          style: _textTheme.bodySmall!.copyWith(
                            letterSpacing: 0,
                            color: AppColors.black,
                            fontWeight: FontThickness.regular,
                          )),
                      if (project.salary != Salary.initial()) ...[
                        const SizedBox(height: 2),
                        BudgetContainer(
                          salary: project.salary,
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
            if (project.skills.isNotEmpty) ...[
              const SizedBox(height: 12),
              Row(
                children: [
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.skills
                        .take(2)
                        .map((skill) => SkillsButton(
                              name: skill.name,
                              borderRadius: 4,
                              fontSize: 10,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 12),
                            ))
                        .toList(),
                  ),
                  const SizedBox(width: 6),
                  if (project.skills.length > 2) ...[
                    const SizedBox(width: 6),
                    SkillsButton(
                      name: "+${project.skills.length - 2} more",
                      borderRadius: 4,
                      fontSize: 10,
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 12),
                    ),
                  ],
                ],
              ),
            ],
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "We’re looking for a skilled and creative freelance developer to bring our app idea to life! If you thrive on challenges and have experience building user-friendly, robust mobile applications, we’d love to hear from you.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: _textTheme.bodySmall!.copyWith(
                  letterSpacing: 0,
                  fontWeight: FontThickness.light,
                  color: AppColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Aligns content dynamically
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.location),
                          const SizedBox(width: 6),
                          Text(project.address,
                              style: _textTheme.labelLarge!
                                  .copyWith(color: AppColors.black)),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 6,
                        children: tag
                            .map((t) => Text(t, style: _textTheme.labelLarge))
                            .toList(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  DueDateSpan(
                    subtitle: AppStrings.posted,
                    title: extractDate(project.createdAt),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
