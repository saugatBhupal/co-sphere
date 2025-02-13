import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/completed_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/members_view.dart';
import 'package:cosphere/src/features/project/presentation/widgets/tab_view/tasks_view.dart';
import 'package:flutter/material.dart';

class ActiveTabbar extends StatelessWidget {
  const ActiveTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              TabBar(
                onTap: (index) {
                  // context
                  //     .read<JobBloc>()
                  //     .add(ChangeCreatedModule(index: index));
                },
                isScrollable: false,
                indicator: const BoxDecoration(),
                dividerHeight: 0,
                padding: const EdgeInsets.only(top: 4),
                tabAlignment: TabAlignment.center,
                unselectedLabelColor: AppColors.grey,
                labelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.semiBold,
                    color: AppColors.midnight),
                unselectedLabelStyle: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.medium,
                    color: AppColors.dim.withOpacity(0.2)),
                labelPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                splashFactory: NoSplash.splashFactory,
                tabs: const [
                  Tab(text: AppStrings.members),
                  Tab(text: "${AppStrings.tasks}(6)"),
                  Tab(text: "${AppStrings.completed} ${AppStrings.tasks}(3)"),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    MembersView(),
                    TasksView(),
                    CompletedTaskView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
