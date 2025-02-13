import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/duration_span.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_owner_details.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/project_skills_list.dart';
import 'package:flutter/material.dart';

class ActiveDetailsBasics extends StatelessWidget {
  const ActiveDetailsBasics({super.key});

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
          const Row(
            children: [
              ProjectOwnerDetails(),
              SizedBox(width: 6),
              BudgetContainer(),
              Spacer(),
              DurationSpan(),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: ProjectSkillsList(),
          ),
          Expanded(
            child: Row(
              children: [
                Text(
                  AppStrings.visible,
                  style: _textTheme.labelLarge!.copyWith(letterSpacing: 0),
                ),
                const Spacer(),
                const FunctionButton(
                  icon: AppIcons.trash,
                  background: AppColors.casa,
                  borderColor: AppColors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
