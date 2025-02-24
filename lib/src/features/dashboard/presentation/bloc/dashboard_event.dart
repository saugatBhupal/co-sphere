part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class ChangeScreenModule extends DashboardEvent {
  final int index;

  const ChangeScreenModule(this.index);
}

class StartUpAppEvent extends DashboardEvent {}

class LoadUserEvent extends DashboardEvent {}

