import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/task_card.dart';

class TasksView extends StatelessWidget {
  final String status;
  const TasksView({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (status == AppStrings.active)
          const Padding(
            padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FunctionButton(
                  icon: AppIcons.edit,
                  title: AppStrings.newTask,
                  padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                ),
              ],
            ),
          ),
        Expanded(
          child: ListView.separated(
            itemCount: 8,
            itemBuilder: (context, index) => const TaskCard(),
            separatorBuilder: (context, index) => const SizedBox(),
          ),
        ),
      ],
    );
  }
}
