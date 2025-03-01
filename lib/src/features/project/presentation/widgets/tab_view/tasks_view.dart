import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/add_task_dialog.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/add_task_form.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/task_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksView extends StatelessWidget {
  final String status;
  final bool postedBy;
  final ActiveScreensArgs screensArgs;
  final List<User> members;

  const TasksView({
    super.key,
    required this.status,
    required this.postedBy,
    required this.members,
    required this.screensArgs,
  });

  @override
  Widget build(BuildContext context) {
    List<Tasks> tasks = context.read<ProjectBloc>().activeTasks;
    return BlocProvider(
      create: (context) => context.read<ProjectBloc>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (postedBy)
            Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FunctionButton(
                    onPressed: () {
                      addTaskDialog(
                        context: context,
                        projectBloc: context.read<ProjectBloc>(),
                        child: AddTaskForm(
                            members: members, projectId: screensArgs.projectId),
                      );
                    },
                    icon: AppIcons.edit,
                    title: AppStrings.newTask,
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                  ),
                ],
              ),
            ),
          if (tasks.isNotEmpty)
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                itemBuilder: (context, index) => TaskCard(
                  task: tasks[index],
                  screensArgs: screensArgs,
                  postedBy: postedBy,
                  projectMembers: members,
                ),
                separatorBuilder: (context, index) => const SizedBox(),
              ),
            ),
        ],
      ),
    );
  }
}
