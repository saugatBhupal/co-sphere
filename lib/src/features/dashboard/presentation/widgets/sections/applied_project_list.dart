import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_title.dart';
import 'package:cosphere/src/features/project/presentation/widgets/card/project_application_card.dart';

class AppliedProjectList extends StatelessWidget {
  final User user;
  const AppliedProjectList({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetAppliedProject(uid: user.uid)),
      child: BlocBuilder<ProjectBloc, ProjectState>(
        builder: (context, state) {
          if (state is GetAppliedProjectFailed) {
            buildToast(toastType: ToastType.error, msg: state.message);
            return const SizedBox.shrink();
          }
          final projectList = context.watch<ProjectBloc>().appliedProjects;
          if (projectList.isEmpty) {
            return const SizedBox.shrink();
          }
          return Column(
            children: [
              DashboardTitle(
                title: AppStrings.projectApp,
                option: AppStrings.view,
                onPressed: () => Navigator.of(context)
                    .pushNamed(AppRoutes.projectApplications, arguments: user),
              ),
              SizedBox(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: projectList.length,
                  itemBuilder: (context, index) => ProjectApplicationCard(
                    project: projectList[index],
                  ),
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 4);
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
