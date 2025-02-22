import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/features/jobs/domain/entities/applicants.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/accepted_members_card.dart';
import 'package:flutter/material.dart';

class MembersView extends StatelessWidget {
  const MembersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 8,
      itemBuilder: (context, index) => AcceptedMembersCard(
          screensArgs: MembersScreensArgs(
              projectId: "", applicant: Applicants.initial())),
      separatorBuilder: (context, index) => const SizedBox(),
    );
  }
}
