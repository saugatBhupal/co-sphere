import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/applicants_card.dart';
import 'package:flutter/material.dart';

class ApplicantsScreen extends StatelessWidget {
  const ApplicantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppbar(
          title: "${AppStrings.all} ${AppStrings.applicants}"),
      body: ListView.separated(
        itemCount: 8,
        itemBuilder: (context, index) => const ApplicantsCard(),
        separatorBuilder: (context, index) => const SizedBox(),
      ),
    );
  }
}
