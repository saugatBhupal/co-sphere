import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/assigned_card.dart';
import 'package:flutter/material.dart';

class AssignedToMeGrid extends StatelessWidget {
  const AssignedToMeGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: context.isTablet ? context.height * 0.13 : context.height / 6,
      child: GridView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 14.0,
          childAspectRatio: context.isTablet ? 0.4 : 0.38,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return const AssignedCard();
        },
      ),
    );
  }
}
