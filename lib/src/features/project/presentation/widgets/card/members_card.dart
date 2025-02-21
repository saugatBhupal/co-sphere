import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/user_details.dart';

class MembersCard extends StatelessWidget {
  final Applicants applicants;
  final Widget? functionWidget;
  const MembersCard({
    Key? key,
    required this.applicants,
    this.functionWidget,
  }) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            UserDetails(
                name: applicants.user.fullname,
                applied: timeAgo(applicants.date)),
            const Spacer(),
            if (functionWidget != null) functionWidget!,
          ],
        ),
      ),
    );
  }
}
