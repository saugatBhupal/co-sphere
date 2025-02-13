import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/accept_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/trash_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/components/due_date_span.dart';
import 'package:flutter/material.dart';

class CompletedTaskCard extends StatelessWidget {
  const CompletedTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      height: context.height / 5.32,
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
                      "Initialize flutter application and connect to database",
                      style: _textTheme.bodyLarge!
                          .copyWith(letterSpacing: 0.2, height: 1),
                    ),
                  ),
                  const DueDateSpan(
                      subtitle: "${AppStrings.completed} ${AppStrings.date}")
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "First initialize flutter app and then goto add dependency and then when you finish adding dependency, you need to connect to the database. If you do not have the database please message me.",
                  style: _textTheme.labelLarge!
                      .copyWith(color: AppColors.grey, height: 1.2),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: [
                  Row(
                    children: List.generate(
                        3,
                        (index) => const Padding(
                              padding: EdgeInsets.only(right: 2),
                              child: CircleImageAvatar(
                                  radius: 8, color: AppColors.red),
                            )),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "19 ${AppStrings.members}",
                    style: _textTheme.labelLarge!
                        .copyWith(color: AppColors.grey, height: 1),
                  ),
                  const Spacer(),
                  const StatusButton(label: 'OnTime'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
