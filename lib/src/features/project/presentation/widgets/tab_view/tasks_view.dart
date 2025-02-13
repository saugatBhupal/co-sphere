import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/task_card.dart';
import 'package:flutter/material.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0, bottom: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FunctionButton(
                icon: AppIcons.edit,
                title: "${AppStrings.edit} ${AppStrings.details}",
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
