import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:cosphere/src/core/utils/from_to_date.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final Project project;
  const HistoryCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        PlaceholderImage(
            title: project.projectName[0], height: context.isTablet ? 52 : 46),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                project.projectName,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.midnight,
                  height: 1,
                  fontSize: context.isTablet ? 18 : 14,
                ),
              ),
              Text(
                project.postedBy.fullname,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontThickness.light,
                  color: AppColors.grey,
                  fontSize: context.isTablet ? 18 : 14,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text:
                            "${formatDate(project.createdAt)} - ${formatDate(project.completionDate)}",
                        style: _textTheme.labelLarge!
                            .copyWith(fontSize: context.isTablet ? 14 : 10)),
                    TextSpan(
                      text:
                          " (${calculateDuration(project.createdAt, project.completionDate)})",
                      style: _textTheme.labelLarge!.copyWith(
                          color: AppColors.midnight,
                          fontSize: context.isTablet ? 14 : 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        StatusButton(label: project.completionType.toDatabaseValue())
      ],
    );
  }
}
