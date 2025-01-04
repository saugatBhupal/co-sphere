import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_body.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardBody(),
      bottomNavigationBar: DashboardBottomNavBar(),
    );
  }
}
