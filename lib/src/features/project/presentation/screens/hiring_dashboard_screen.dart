import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/applicants_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/members_list.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_details_basics.dart';
import 'package:cosphere/src/features/project/presentation/widgets/hiring/hiring_header.dart';
import 'package:flutter/material.dart';

class HiringDashboardScreen extends StatelessWidget {
  const HiringDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const CommonAppbar(
          title: "${AppStrings.project} ${AppStrings.details}"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HiringHeader(),
            HiringDetailsBasics(),
            ApplicantsList(),
            SizedBox(height: 8),
            MembersList(),
          ],
        ),
      ),
    );
  }
}
