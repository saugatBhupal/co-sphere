import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:cosphere/src/features/project/domain/entities/tasks.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/due_date_span.dart';
import 'package:flutter/material.dart';

class CompletedTaskCard extends StatelessWidget {
  final Tasks task;
  final List<User> projectMembers;
  const CompletedTaskCard({super.key, required this.task, required this.projectMembers});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return IntrinsicHeight(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: const BoxDecoration(
          color: AppColors.white,
          border: Border(
            top: BorderSide(color: AppColors.plaster, width: 0.5),
            bottom: BorderSide(color: AppColors.plaster, width: 0.5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        task.taskName,
                        style: _textTheme.bodyLarge!.copyWith(
                          letterSpacing: 0.2,
                          height: 1,
                          fontSize: context.isTablet ? 20 : 14,
                        ),
                      ),
                    ),
                    DueDateSpan(
                      subtitle: "${AppStrings.completed} ${AppStrings.date}",
                      title: extractDate(task.completionDate),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    task.taskDescription,
                    style: _textTheme.labelLarge!.copyWith(
                      color: AppColors.grey,
                      height: 1.2,
                      fontSize: context.isTablet ? 16 : 10,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                          task.members.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(right: 2),
                                child: PlaceholderImage(
                                  height: 20,
                                  imageUrl: projectMembers
                                      .where((member) =>
                                          member.uid == task.members[index].uid)
                                      .first
                                      .profileImage,
                                  title: projectMembers
                                      .where((member) =>
                                          member.uid == task.members[index].uid)
                                      .first
                                      .fullname[0],
                                ),
                              )),
                    ),
                    const SizedBox(width: 2),
                    Text(
                      "${task.members.length} ${task.members.length > 1 ? AppStrings.members : "Member"}",
                      style: _textTheme.labelLarge!.copyWith(
                        color: AppColors.grey,
                        height: 1,
                        fontSize: context.isTablet ? 16 : 10,
                      ),
                    ),
                    const Spacer(),
                    StatusButton(label: task.completionType.toDatabaseValue()),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
