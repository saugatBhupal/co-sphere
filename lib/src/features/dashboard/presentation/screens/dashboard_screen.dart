import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/functions/show_notification.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/explore/presentation/screens/explore_job_screen.dart';
import 'package:cosphere/src/features/explore/presentation/screens/explore_project_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/create_screen.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/screens/dashboard_body.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_bottom_nav_bar.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/dashboard_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  const DashboardScreen({
    super.key,
    required this.user,
  });

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final SocketService _socketService = SocketService();
  @override
  void initState() {
    super.initState();
    _setupSocketListeners();
  }

  void _setupSocketListeners() {
    final socket = _socketService.socket;
    if (socket == null) return;

    socket.on("receiveNotification", (data) {
      showNotification(data);
    }); 
  }

  @override
  void dispose() {
    _socketService.socket?.off("receiveNotification");
    super.dispose();
  }

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
              ? DashboardBody(user: widget.user)
              : _getHomeBodyModule(state.index),
          bottomNavigationBar: const DashboardBottomNavBar(),
        );
      },
    );
  }

  Widget _getHomeBodyModule(int index) {
    switch (index) {
      case 0:
        return DashboardBody(user: widget.user);
      case 1:
        return ExploreProjectScreen(user: widget.user);
      case 2:
        return CreateScreen(user: widget.user);
      case 3:
        return ExploreJobScreen(user: widget.user);
      case 4:
        return ProfileScreen(uid: widget.user.uid);
      default:
        return DashboardBody(user: widget.user);
    }
  }
}
