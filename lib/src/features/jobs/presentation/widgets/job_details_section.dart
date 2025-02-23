import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';

class JobDetailsSection extends StatelessWidget {
  final JobSection section;
  const JobDetailsSection({
    super.key,
    required this.section,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: textTheme.bodyLarge!.copyWith(
                letterSpacing: 0, fontSize: context.isTablet ? 18 : 14),
          ),
          const SizedBox(height: 4),
          if (section.description != null && section.description!.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                section.description!,
                style: textTheme.bodyLarge!.copyWith(
                    letterSpacing: 0,
                    fontWeight: FontThickness.light,
                    fontSize: context.isTablet ? 18 : 14,
                    color: AppColors.grey),
              ),
            ),
          if (section.lstDescription != null &&
              section.lstDescription!.isNotEmpty)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: section.lstDescription!
                  .map(
                    (desc) => Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("• ", style: TextStyle(fontSize: 14)),
                          Expanded(
                            child: Text(
                              desc,
                              style: textTheme.bodyLarge!.copyWith(
                                  letterSpacing: 0,
                                  fontSize: context.isTablet ? 18 : 14,
                                  fontWeight: FontThickness.light,
                                  color: AppColors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
    );
  }
}
