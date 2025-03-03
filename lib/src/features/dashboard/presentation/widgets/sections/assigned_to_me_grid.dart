import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/assigned_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignedToMeGrid extends StatelessWidget {
  final User user;
  const AssignedToMeGrid({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProjectBloc>()..add(GetActiveTask(uid: user.uid)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetActiveTaskFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          final projectList = context.watch<ProjectBloc>().assignedProjects;
          if (projectList.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              DashboardTitle(
                title: AppStrings.assigned,
                option: AppStrings.view,
                onPressed: () => Navigator.of(context).pushNamed(
                    AppRoutes.assignedTasks,
                    arguments: AssignedTaskScreenArgs(
                        projects: projectList, user: user)),
              ),
              SizedBox(
                width: context.width,
                height: context.isTablet
                    ? context.height * 0.119
                    : context.height / 6,
                child: GridView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: context.isTablet ? 0.4 : 0.38,
                  ),
                  itemCount: projectList.length > 3 ? 3 : projectList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AssignedCard(
                        project: projectList[index], uid: user.uid);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
