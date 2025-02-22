import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/domain/entities/project.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_header.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active_completed/project_tabbar.dart';
import 'package:flutter/material.dart';

class CompletedDashboardScreen extends StatelessWidget {
  const CompletedDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonAppbar(title: "${AppStrings.project} ${AppStrings.details}"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ProjectHeader(status: AppStrings.completed),
          ProjectDetailsBasics(project: Project.initial()),
          Expanded(
              child: ProjectTabbar(
                  status: AppStrings.completed, project: Project.initial())),
        ],
      ),
    );
  }
}
