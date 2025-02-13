import 'package:cosphere/src/features/project/presentation/widgets/card/completed_task_card.dart';
import 'package:flutter/material.dart';

class CompletedTaskView extends StatelessWidget {
  const CompletedTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      itemBuilder: (context, index) => const CompletedTaskCard(),
      separatorBuilder: (context, index) => const SizedBox(),
    );
  }
}
