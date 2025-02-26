import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/active_application_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/completed_application_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/hiring_application_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProjectApplicationsTabbar extends StatelessWidget {
  final User user;
  const ProjectApplicationsTabbar({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) =>
          sl<ProjectBloc>()..add(GetAppliedProject(uid: user.uid)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  isScrollable: false,
                  indicator: const BoxDecoration(),
                  dividerHeight: 0,
                  padding: const EdgeInsets.only(top: 4),
                  tabAlignment: TabAlignment.center,
                  unselectedLabelColor: AppColors.grey,
                  labelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.semiBold,
                    color: AppColors.midnight,
                    fontSize: context.isTablet ? 16 : 12,
                  ),
                  unselectedLabelStyle: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontThickness.medium,
                      fontSize: context.isTablet ? 16 : 12,
                      color: AppColors.dim.withOpacity(0.2)),
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(text: AppStrings.hiring),
                    Tab(text: AppStrings.active),
                    Tab(text: AppStrings.completed),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      HiringApplicationView(uid: user.uid),
                      ActiveApplicationView(uid: user.uid),
                      CompletedApplicationView(uid: user.uid),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
