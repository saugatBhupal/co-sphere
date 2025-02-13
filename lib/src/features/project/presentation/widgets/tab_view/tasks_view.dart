import 'package:cosphere/src/features/project/presentation/widgets/card/task_card.dart';
import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        child: ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (context, index) => const TaskCard(),
          separatorBuilder: (context, index) {
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
