part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

class ScreenModuleChanged extends DashboardState {
  final int index;

  const ScreenModuleChanged(this.index);
  @override
  List<Object> get props => [index];
}

class DashboardStartupLoading extends DashboardState {}

class DashboardGetUserSuccess extends DashboardState {
  final User? user;

  const DashboardGetUserSuccess({
    this.user,
  });
}

class DashboardGetUserFailed extends DashboardState {
  final String message;

  const DashboardGetUserFailed({required this.message});
}

class DashboardGetCacheUserSuccess extends DashboardState {
  final User user;

  const DashboardGetCacheUserSuccess({required this.user});
}

class GetProjectByUserLoading extends DashboardState {
  const GetProjectByUserLoading();
}

class GetProjectByUserSuccess extends DashboardState {
  final List<Project> projects;
  const GetProjectByUserSuccess({required this.projects});
}

class GetProjectByUserFailed extends DashboardState {
  final String message;
  const GetProjectByUserFailed({required this.message});
}
