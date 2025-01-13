import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/application_card.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/assigned_card.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/created_card.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_functions.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_metrics.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const DashboardFunctions(),
              const DashboardMetrics(),
              const DashboardTitle(
                  title: AppStrings.created, option: AppStrings.view),
              SizedBox(
                height: context.height * 0.17,
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: 0.40,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return const CreatedCard();
                  },
                ),
              ),
              const DashboardTitle(
                  title: AppStrings.assigned, option: AppStrings.view),
              SizedBox(
                height: context.height * 0.17,
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: 0.40,
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return const AssignedCard();
                  },
                ),
              ),
              const DashboardTitle(
                  title: AppStrings.application, option: AppStrings.view),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) => const ApplicationCard(),
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
