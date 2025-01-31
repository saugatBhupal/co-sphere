import 'package:flutter/material.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/screens/dashboard_body.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_bottom_nav_bar.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  const DashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashboardAppbar(user: user),
      body: DashboardBody(user: user),
      bottomNavigationBar: const DashboardBottomNavBar(),
    );
  }
}
