import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_grid_info.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/cards_header_info.dart';

class ActiveCard extends StatelessWidget {
  const ActiveCard({
    super.key,
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
        child: const Column(
          children: [
            CardsHeaderInfo(),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: AppStrings.applicants,
                    border: true,
                    padding: 4,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: AppStrings.tasks,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: AppStrings.completed,
                    border: true,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  child: CardsGridInfo(
                    title: "20",
                    subtitle: AppStrings.remaining,
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
