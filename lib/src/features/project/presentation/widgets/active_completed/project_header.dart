import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/posted_span.dart';
import 'package:flutter/material.dart';

class ProjectHeader extends StatelessWidget {
  final String status;
  final String projectId;
  final String projectName;
  final DateTime postedOn;
  const ProjectHeader({
    super.key,
    required this.status,
    required this.projectId,
    required this.projectName,
    required this.postedOn,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            projectName,
            style: _textTheme.headlineSmall!
                .copyWith(height: 1.2, fontSize: context.isTablet ? 24 : 20),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              PostedSpan(posted: timeAgo(postedOn)),
              const SizedBox(width: 12),
              StatusButton(
                  label: status,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 10)),
              const Spacer(),
              if (status == AppStrings.active)
                SizedBox(
                  width: context.width / 4,
                  child: DarkRoundedButton(
                    onPressed: () {},
                    fontSize: context.isTablet ? 15 : 10,
                    title: "${AppStrings.finish} ${AppStrings.project}",
                    padding: const EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
