import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              DashboardHeader(),
            ],
          ),
        ),
      ),
    );
  }
}
