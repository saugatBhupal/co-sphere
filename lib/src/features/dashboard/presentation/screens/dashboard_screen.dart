import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/project/presentation/screens/create_project_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:cosphere/src/features/project/presentation/widgets/form/add_task_form.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/screens/dashboard_body.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_bottom_nav_bar.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  final User user;
  const DashboardScreen({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    context.read<DashboardBloc>().add(LoadUserEvent());
    return BlocBuilder<DashboardBloc, DashboardState>(
      buildWhen: (previous, current) {
        return current is DashboardGetCacheUserSuccess ||
            current is ScreenModuleChanged;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: state is ScreenModuleChanged && state.index != 0
              ? null
              : const DashboardAppbar(),
          body: state is! ScreenModuleChanged
              ? DashboardBody(user: user)
              : _getHomeBodyModule(state.index),
          bottomNavigationBar: const DashboardBottomNavBar(),
        );
      },
    );
  }

  Widget _getHomeBodyModule(int index) {
    switch (index) {
      case 0:
        return DashboardBody(user: user);
      case 1:
        return CreateProjectScreen(user: user);
      case 2:
        return CreateProjectScreen(user: user);
      case 3:
        return const AddTaskForm(
          members: [],
          projectId: "",
        );
      case 4:
        return ProfileScreen(uid: user.uid);
      default:
        return DashboardBody(user: user);
    }
  }
}
