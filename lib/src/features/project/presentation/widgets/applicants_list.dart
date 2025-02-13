import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/applicants_card.dart';
import 'package:flutter/material.dart';

class ApplicantsList extends StatelessWidget {
  const ApplicantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const DashboardTitle(
          title: "${AppStrings.all} ${AppStrings.applicants} (23)",
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          option: AppStrings.view,
        ),
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => const ApplicantsCard(),
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
