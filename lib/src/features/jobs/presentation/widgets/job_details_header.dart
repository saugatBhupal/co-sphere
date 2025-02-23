import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/posted_span.dart';
import 'package:flutter/material.dart';

class JobDetailsHeader extends StatelessWidget {
  const JobDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Develop a Mobile App for Food Delivery",
          style: _textTheme.headlineSmall!
              .copyWith(height: 1.2, fontSize: context.isTablet ? 24 : 20),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const PostedSpan(),
            const SizedBox(width: 12),
            BudgetContainer(
              salary: Salary.initial(),
            ),
            const Spacer(),
            const FunctionButton(icon: AppIcons.heart),
            const SizedBox(width: 8),
            const FunctionButton(icon: AppIcons.share),
          ],
        ),
      ],
    );
  }
}
