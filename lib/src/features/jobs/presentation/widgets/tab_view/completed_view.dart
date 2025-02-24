import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/completed_card.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CompletedView extends StatelessWidget {
  final String uid;
  const CompletedView({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetCompletedProject(uid: uid)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetProjectFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          if (state is GetProjectLoading) {
            return const SizedBox.shrink();
          }
          if (state is GetCompletedProjectSuccess) {
            if (state.projects.isEmpty) {
              return Center(
                child: Text(
                  "No Projects Completed",
                  style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                ),
              );
            }
            return SizedBox(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.projects.length,
                itemBuilder: (context, index) =>
                    CompletedCard(project: state.projects[index]),
                separatorBuilder: (context, index) => const SizedBox(height: 4),
              ),
            );
          }
          return Center(
            child: Text(
              "No Projects Completed",
              style: textTheme.bodyMedium?.copyWith(color: AppColors.grey),
            ),
          );
        },
      ),
    );
  }
}
