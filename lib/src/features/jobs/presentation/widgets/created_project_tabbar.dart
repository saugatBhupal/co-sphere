import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tab_view/active_view.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tab_view/completed_view.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/tab_view/hiring_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatedProjectTabbar extends StatelessWidget {
  const CreatedProjectTabbar({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return BlocBuilder<JobBloc, JobState>(
      buildWhen: (previous, current) {
        return current is CreatedModuleChanged;
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  TabBar(
                    onTap: (index) {
                      context
                          .read<JobBloc>()
                          .add(ChangeCreatedModule(index: index));
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
                    labelPadding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 6.8),
                    splashFactory: NoSplash.splashFactory,
                    tabs: const [
                      Tab(text: AppStrings.hiring),
                      Tab(text: AppStrings.active),
                      Tab(text: AppStrings.completed),
                    ],
                  ),
                  const Expanded(
                    child: TabBarView(
                      children: [
                        HiringView(),
                        ActiveView(),
                        CompletedView(),
                      ],
                    ),
                  ),
                  // state is! CreatedModuleChanged
                  //     ? const HiringView()
                  //     : _getCreatedModule(state.index),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _getCreatedModule(int index) {
    switch (index) {
      case 0:
        return const HiringView();
      case 1:
        return const ActiveView();
      case 2:
        return const CompletedView();
      default:
        return const HiringView();
    }
  }
}
