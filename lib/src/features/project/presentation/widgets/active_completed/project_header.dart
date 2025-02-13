import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/status_button.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/posted_span.dart';
import 'package:flutter/material.dart';

class ProjectHeader extends StatelessWidget {
  final String status;
  const ProjectHeader({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        children: [
          Text(
            "Develop a Mobile App for Food Delivery",
            style:
                _textTheme.headlineSmall!.copyWith(height: 1.2, fontSize: 20),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const PostedSpan(),
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
                    fontSize: 10,
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
