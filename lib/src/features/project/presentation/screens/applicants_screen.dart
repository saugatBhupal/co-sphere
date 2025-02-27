import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';

import 'package:cosphere/src/features/project/presentation/widgets/card/applicants_card.dart';
import 'package:flutter/material.dart';

class ApplicantsScreen extends StatelessWidget {
  final ApplicantsScreenArgs screenArgs;
  const ApplicantsScreen({super.key, required this.screenArgs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
          title: "${AppStrings.all} ${AppStrings.applicants}"),
      body: ListView.separated(
        itemCount: screenArgs.applicants.length,
        itemBuilder: (context, index) => ApplicantsCard(
          applicant: screenArgs.applicants[index],
          projectId: screenArgs.projectId,
        ),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
