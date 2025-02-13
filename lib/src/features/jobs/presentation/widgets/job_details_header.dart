import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/budget_container.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/posted_span.dart';
import 'package:flutter/material.dart';

class JobDetailsHeader extends StatelessWidget {
  const JobDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Develop a Mobile App for Food Delivery",
          style: _textTheme.headlineSmall!.copyWith(height: 1.2, fontSize: 20),
        ),
        const SizedBox(height: 6),
        const Row(
          children: [
            PostedSpan(),
            SizedBox(width: 12),
            BudgetContainer(),
            Spacer(),
            FunctionButton(icon: AppIcons.heart),
            SizedBox(width: 8),
            FunctionButton(icon: AppIcons.share),
          ],
        ),
      ],
    );
  }
}
