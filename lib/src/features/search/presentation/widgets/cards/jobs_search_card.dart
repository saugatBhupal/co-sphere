import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/profile/presentation/widgets/button/skills_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/due_date_span.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter_svg/svg.dart';

class JobsSearchCard extends StatelessWidget {
  const JobsSearchCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List tag = ["Remote", "Full Time", "Company"];
    final List<String> skillsLst = [
      "Mobile Dev",
      "Mobile Dev",
      "React JS",
      "React JS"
    ];
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.hiring),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: context.height / 3.8,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
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
                        "Esewa",
                        style: _textTheme.labelLarge!.copyWith(height: 1),
                      ),
                      Text("Product Designer",
                          style: _textTheme.bodySmall!.copyWith(
                            letterSpacing: 0,
                            color: AppColors.black,
                            fontWeight: FontThickness.regular,
                          )),
                    ],
                  ),
                ),
                const BudgetContainer()
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: skillsLst
                      .take(2)
                      .map((skill) => SkillsButton(
                            name: skill,
                            borderRadius: 4,
                            fontSize: 10,
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 12),
                          ))
                      .toList(),
                ),
                const SizedBox(width: 6),
                if (skillsLst.length > 2) ...[
                  const SizedBox(width: 6),
                  SkillsButton(
                    name: "+${skillsLst.length - 2} more",
                    borderRadius: 4,
                    fontSize: 10,
                    padding:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  ),
                ],
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
              child: Text(
                "We’re looking for a skilled and creative freelance developer to bring our app idea to life! If you thrive on challenges and have experience building user-friendly, robust mobile applications, we’d love to hear from you.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: _textTheme.bodySmall!.copyWith(
                  letterSpacing: 0,
                  height: 0,
                  fontWeight: FontThickness.light,
                  color: AppColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.location),
                          const SizedBox(width: 6),
                          Text("Kathmandu, Nepal",
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
                  const DueDateSpan(subtitle: AppStrings.posted)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
