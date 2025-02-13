import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job_section.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_basics.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_header.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/job_details_section.dart';
import 'package:flutter/material.dart';

class JobDetailsScreen extends StatelessWidget {
  const JobDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:
          const CommonAppbar(title: "${AppStrings.job} ${AppStrings.details}"),
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JobDetailsHeader(),
                  JobDetailsBasics(),
                  JobDetailsSection(
                    section: JobSection(
                      title: "What I Need?",
                      description:
                          "We’re looking for a skilled and creative freelance developer to bring our app idea to life! If you thrive on challenges and have experience building user-friendly, robust mobile applications, we’d love to hear from you.",
                    ),
                  ),
                  JobDetailsSection(
                    section: JobSection(
                      title: "Platform",
                      lstDescription: ["iOS", "Android"],
                    ),
                  ),
                  JobDetailsSection(
                    section: JobSection(
                      title: "Features",
                      lstDescription: [
                        "Insect Identification: Upload or capture an image to identify pests (e.g., fruit flies) using image classification APIs.",
                        "Detailed Pest Information: Provide causes, harmful effects, and recommended fertilizers in English and Nepali.",
                      ],
                    ),
                  ),
                  JobDetailsSection(
                    section: JobSection(
                      title: "Deliverables",
                      lstDescription: [
                        "Fully functional mobile app.",
                        "User-friendly UI/UX design.",
                        "Backend integration with cloud services.",
                      ],
                    ),
                  ),
                  JobDetailsSection(
                    section: JobSection(
                      title: "Requirements",
                      lstDescription: [
                        "Experience with Flutter or React Native.",
                        "Understanding of image processing APIs.",
                        "Ability to implement multi-language support.",
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: AppColors.white,
              child: const DarkRoundedButton(
                title: AppStrings.apply,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
