import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/active_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/completed_card.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/card/hiring_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatedByMeDashboard extends StatelessWidget {
  final String uid;
  const CreatedByMeDashboard({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<DashboardBloc>()..add(GetProjectByUser(uid: uid)),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is GetProjectByUserFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          final projectList = context.watch<DashboardBloc>().createdProjects;
          if (projectList.isEmpty) {
            return const SizedBox.shrink();
          }
          return SizedBox(
            height: context.height * 0.17,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 14.0,
                childAspectRatio: 0.38,
              ),
              itemCount: projectList.length,
              itemBuilder: (BuildContext context, int index) {
                final project = projectList[index];
                return project.status == Status.hiring
                    ? HiringCard(project: project)
                    : project.status == Status.active
                        ? ActiveCard(project: project)
                        : CompletedCard(project: project);
              },
            ),
          );
        },
      ),
    );
  }
}
