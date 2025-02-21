part of 'project_bloc.dart';

sealed class ProjectState extends Equatable {
  const ProjectState();

  @override
  List<Object> get props => [];
}

final class ProjectInitial extends ProjectState {}

class GetProjectLoading extends ProjectState {
  const GetProjectLoading();
}

class GetHireProjectSuccess extends ProjectState {
  final List<Project> projects;
  const GetHireProjectSuccess({required this.projects});
}

class GetProjectFailed extends ProjectState {
  final String message;
  const GetProjectFailed({required this.message});
}

class GetActiveProjectSuccess extends ProjectState {
  final List<Project> projects;
  const GetActiveProjectSuccess({required this.projects});
}

class GetCompletedProjectSuccess extends ProjectState {
  final List<Project> projects;
  const GetCompletedProjectSuccess({required this.projects});
}

class GetProjectByIdSuccess extends ProjectState {
  final Project project;
  const GetProjectByIdSuccess({required this.project});
}
