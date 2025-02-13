import 'package:cosphere/src/features/jobs/presentation/widgets/card/hiring_card.dart';
import 'package:flutter/material.dart';

class HiringView extends StatelessWidget {
  const HiringView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) => const HiringCard(),
        separatorBuilder: (context, index) {
          return const SizedBox(height: 4);
        },
      ),
    );
  }
}
