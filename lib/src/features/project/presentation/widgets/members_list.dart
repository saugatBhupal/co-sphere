import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/members_card.dart';
import 'package:flutter/material.dart';

class MembersList extends StatelessWidget {
  final List<Applicants> applicants;
  final String title;
  final Widget functionWidget;
  const MembersList({
    super.key,
    required this.applicants,
    required this.title,
    required this.functionWidget,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardTitle(
          title: "$title (${applicants.length})",
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          option: AppStrings.view,
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.members),
        ),
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: applicants.length,
            itemBuilder: (context, index) => MembersCard(
                applicants: applicants[index], functionWidget: functionWidget),
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
