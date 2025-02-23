import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/job_application_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/project_application_card.dart';
import 'package:flutter/material.dart';

class ApplicationsScreen extends StatelessWidget {
  const ApplicationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const SearchFieldAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.application,
                style: _textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: context.isTablet ? 18 : 14,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => const JobApplicationCard(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
              // const SizedBox(height: 4),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) =>
                      const ProjectApplicationCard(),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
