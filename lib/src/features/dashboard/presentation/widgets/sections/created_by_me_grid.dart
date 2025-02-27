import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/active_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/completed_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/hiring_card.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatedByMeGrid extends StatelessWidget {
  final User user;
  const CreatedByMeGrid({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetProjectByUser(uid: user.uid)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetProjectByUserFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          final projectList = context.watch<ProjectBloc>().createdProjects;
          if (projectList.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              DashboardTitle(
                title: AppStrings.created,
                option: AppStrings.view,
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.createdProjects, arguments: user),
              ),
              SizedBox(
                height: context.isTablet
                    ? context.height * 0.13
                    : context.height * 0.17,
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 14.0,
                    childAspectRatio: context.isTablet ? 0.4 : 0.38,
                  ),
                  itemCount: projectList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final project = projectList[index];
                    return project.status == Status.hiring
                        ? HiringCard(project: project, uid: user.uid)
                        : project.status == Status.active
                            ? ActiveCard(project: project, uid: user.uid)
                            : CompletedCard(project: project, uid: user.uid);
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
