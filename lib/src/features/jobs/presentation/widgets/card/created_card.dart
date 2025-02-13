import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_grid_info.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_header_info.dart';

class CreatedCard extends StatelessWidget {
  final String status;
  const CreatedCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed(AppRoutes.jobDetails),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(vertical: 4),
        height: context.height / 6.4,
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(width: 1, color: AppColors.plaster),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const CardsHeaderInfo(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: status == AppStrings.hiring
                        ? AppStrings.applicants
                        : AppStrings.members,
                    border: true,
                    padding: 4,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: status == AppStrings.hiring
                        ? AppStrings.likes
                        : AppStrings.tasks,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: status == AppStrings.hiring
                        ? AppStrings.rejected
                        : AppStrings.completed,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: status == AppStrings.hiring
                        ? AppStrings.hired
                        : status == AppStrings.active
                            ? AppStrings.remaining
                            : AppStrings.duration,
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
