import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/cards_grid_info.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/cards_header_info.dart';
import 'package:flutter/material.dart';

class CreatedCard extends StatelessWidget {
  const CreatedCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
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
                  subtitle: AppStrings.likes,
                  border: true,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: CardsGridInfo(
                  title: "20",
                  subtitle: AppStrings.rejected,
                  border: true,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: CardsGridInfo(
                  title: "20",
                  subtitle: AppStrings.hired,
                  border: false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
