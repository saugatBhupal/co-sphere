import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/completion_container.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_functions.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_metrics.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            DashboardFunctions(),
            DashboardMetrics(),
          ],
        ),
      ),
    );
  }
}
