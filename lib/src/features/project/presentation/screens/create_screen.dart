import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/appbar/common_appbar.dart';
import 'package:cosphere/src/features/jobs/presentation/screens/create_job_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/create_project_screen.dart';
import 'package:flutter/material.dart';

class CreateScreen extends StatelessWidget {
  final User user;
  const CreateScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CommonAppbar(title: AppStrings.create),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  onTap: (index) {},
                  isScrollable: false,
                  indicator: const BoxDecoration(),
                  dividerHeight: 0,
                  tabAlignment: TabAlignment.center,
                  unselectedLabelColor: AppColors.grey,
                  labelStyle: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontThickness.semiBold,
                      fontSize: context.isTablet ? 16 : 12,
                      color: AppColors.midnight),
                  unselectedLabelStyle: _textTheme.bodySmall!.copyWith(
                      fontWeight: FontThickness.medium,
                      fontSize: context.isTablet ? 16 : 12,
                      color: AppColors.dim.withOpacity(0.2)),
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 6.8),
                  splashFactory: NoSplash.splashFactory,
                  tabs: const [
                    Tab(text: AppStrings.job),
                    Tab(text: AppStrings.project),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      CreateJobScreen(user: user),
                      CreateProjectScreen(user: user),
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
