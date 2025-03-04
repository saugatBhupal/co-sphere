import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_grid_info.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_header_info.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';

class AssignedCard extends StatelessWidget {
  final Project project;
  final String uid;
  const AssignedCard({
    Key? key,
    required this.project,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            CardsHeaderInfo(
              title: project.tasks.first.taskName,
              subtitle: AppStrings.assignedOn,
              postedOn: extractDate(project.tasks.first.createdDate),
            ),
            const SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CardsGridInfo(
                      title:
                          "${project.tasks.first.deadline.difference(DateTime.now()).inDays.toString()} (D)",
                      subtitle: AppStrings.deadline,
                      color: AppColors.red,
                      padding: 32,
                    ),
                  ),
                  Expanded(
                    child: CardsGridInfo(
                      title:
                          "${DateTime.now().difference(project.tasks.first.createdDate).inDays.toString()} (D)",
                      subtitle: AppStrings.timeSpent,
                    ),
                  ),
                  const Expanded(
                    child: CardsGridInfo(
                      title: "2",
                      subtitle: AppStrings.completion,
                      border: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
