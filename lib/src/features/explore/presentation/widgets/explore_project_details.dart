import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_basics.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_section.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:flutter/material.dart';

class ExploreProjectDetails extends StatelessWidget {
  final Project project;

  const ExploreProjectDetails(
      {super.key, required this.project});

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
              JobDetailsBasics(project: project),
              const JobDetailsSection(
                section: JobSection(
                  title: "What I Need?",
                  description:
                      "We’re looking for a skilled and creative freelance developer to bring our app idea to life! If you thrive on challenges and have experience building user-friendly, robust mobile applications, we’d love to hear from you.",
                ),
              ),
              const JobDetailsSection(
                section: JobSection(
                  title: "Platform",
                  lstDescription: ["iOS", "Android"],
                ),
              ),
              const JobDetailsSection(
                section: JobSection(
                  title: "Features",
                  lstDescription: [
                    "Insect Identification: Upload or capture an image to identify pests (e.g., fruit flies) using image classification APIs.",
                    "Detailed Pest Information: Provide causes, harmful effects, and recommended fertilizers in English and Nepali.",
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
