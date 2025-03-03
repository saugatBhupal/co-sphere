import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_section.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/widgets/project_explore_basic_details.dart';
import 'package:flutter/material.dart';

class ExploreProjectDetails extends StatelessWidget {
  final Project project;

  const ExploreProjectDetails({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppbar(
          title: "${AppStrings.project} ${AppStrings.details}"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JobDetailsHeader(
                title: project.projectName,
                postedOn: project.createdAt,
                salary: project.salary,
              ),
              ProjectExploreBasicDetails(project: project),
              JobDetailsSection(
                section: JobSection(
                    title: AppStrings.description,
                    description: project.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
