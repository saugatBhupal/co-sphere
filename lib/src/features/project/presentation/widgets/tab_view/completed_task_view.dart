import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/completed_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedTaskView extends StatelessWidget {
  final List<User> members;
  const CompletedTaskView({super.key, required this.members});

  @override
  Widget build(BuildContext context) {
    List<Tasks> tasks = context.read<ProjectBloc>().completedTasks;
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) => CompletedTaskCard(
        task: tasks[index],
        projectMembers: members,
      ),
      separatorBuilder: (context, index) => const SizedBox(),
    );
  }
}
