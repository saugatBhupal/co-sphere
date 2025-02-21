import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/accept_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/reject_button.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/user_details.dart';
import 'package:flutter/material.dart';

class ApplicantsCard extends StatelessWidget {
  final Applicants applicant;
  const ApplicantsCard({super.key, required this.applicant});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.plaster, width: 0.5),
          bottom: BorderSide(color: AppColors.plaster, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 12),
        child: Row(
          children: [
            UserDetails(
                name: applicant.user.fullname,
                applied: timeAgo(applicant.date)),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      AcceptButton(),
                      SizedBox(width: 8),
                      RejectButton(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(
                      AppStrings.tap,
                      style: _textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
