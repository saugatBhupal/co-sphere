import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/features/project/data/dto/hire_user_req_dto.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/buttons/accept_button.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/user_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RejectedMembersCard extends StatelessWidget {
  final MembersScreensArgs screensArgs;
  const RejectedMembersCard({
    super.key,
    required this.screensArgs,
  });

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
                name: screensArgs.applicant.user.fullname,
                applied: timeAgo(screensArgs.applicant.date)),
            const Spacer(),
            AcceptButton(
              onTap: () => context.read<ProjectBloc>().add(HireUser(
                  dto: HireUserReqDto(
                      userId: screensArgs.applicant.user.uid,
                      projectId: screensArgs.projectId))),
            ),
          ],
        ),
      ),
    );
  }
}
