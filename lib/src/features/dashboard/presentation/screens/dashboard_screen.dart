import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
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
