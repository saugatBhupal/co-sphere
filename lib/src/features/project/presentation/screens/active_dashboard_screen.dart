import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active/active_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active/active_header.dart';
import 'package:cosphere/src/features/project/presentation/widgets/active/active_tabbar.dart';
import 'package:flutter/material.dart';

class ActiveDashboardScreen extends StatelessWidget {
  const ActiveDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const CommonAppbar(
          title: "${AppStrings.project} ${AppStrings.details}"),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ActiveHeader(),
          ActiveDetailsBasics(),
          Expanded(child: ActiveTabbar()),
        ],
      ),
    );
  }
}
