import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/applicants_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApplicantsList extends StatelessWidget {
  final String projectId;
  const ApplicantsList({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    final List<Applicants> applicants = context.read<ProjectBloc>().applicants;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DashboardTitle(
          title:
              "${AppStrings.all} ${AppStrings.applicants} (${applicants.length})",
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          option: AppStrings.view,
          onPressed: () => Navigator.of(context).pushNamed(AppRoutes.applicants,
              arguments: ApplicantsScreenArgs(
                  applicants: applicants, projectId: projectId)),
        ),
        SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: applicants.length,
            itemBuilder: (context, index) => ApplicantsCard(
              applicant: applicants[index],
              projectId: projectId,
            ),
            separatorBuilder: (context, index) {
              return const SizedBox();
            },
          ),
        ),
      ],
    );
  }
}
