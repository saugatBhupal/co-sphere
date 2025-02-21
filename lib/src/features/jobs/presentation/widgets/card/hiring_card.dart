import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_grid_info.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_header_info.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';

class HiringCard extends StatelessWidget {
  final Project project;
  const HiringCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    final applicants = project.acceptedApplicants.length +
        project.rejectedApplicants.length +
        project.pendingApplicants.length;
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.hiring),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        constraints: BoxConstraints(minHeight: context.height / 8),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CardsHeaderInfo(
                title: project.projectName,
                postedOn: extractDate(project.createdAt)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: applicants.toString(),
                    subtitle: AppStrings.applicants,
                    border: true,
                    padding: 4,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: project.likesCount.toString(),
                    subtitle: AppStrings.likes,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: project.rejectedApplicants.length.toString(),
                    subtitle: AppStrings.rejected,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: project.acceptedApplicants.length.toString(),
                    subtitle: AppStrings.hired,
                    border: false,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
