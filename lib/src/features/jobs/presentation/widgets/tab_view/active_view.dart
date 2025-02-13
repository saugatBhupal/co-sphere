import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/created_card.dart';
import 'package:flutter/material.dart';

class ActiveView extends StatelessWidget {
  const ActiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) =>
            const CreatedCard(status: AppStrings.active),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}
