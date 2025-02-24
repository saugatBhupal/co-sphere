import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/appbar/search_field_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/project_application_card.dart';
import 'package:flutter/material.dart';

class ProjectApplicationsScreen extends StatelessWidget {
  final List<Project> projects;
  const ProjectApplicationsScreen({super.key, required this.projects});

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
                  itemCount: projects.length,
                  itemBuilder: (context, index) => ProjectApplicationCard(
                    project: projects[index],
                  ),
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
