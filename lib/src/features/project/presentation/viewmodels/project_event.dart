part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class GetHiringProject extends ProjectEvent {
  final String uid;

  const GetHiringProject({required this.uid});
}

class GetActiveProject extends ProjectEvent {
  final String uid;

  const GetActiveProject({required this.uid});
}

class GetCompletedProject extends ProjectEvent {
  final String uid;

  const GetCompletedProject({required this.uid});
}

class GetProjectByID extends ProjectEvent {
  final String projectId;

  const GetProjectByID({required this.projectId});
}

class HireUser extends ProjectEvent {
  final HireUserReqDto dto;

  const HireUser({required this.dto});
}

class RejectUser extends ProjectEvent {
  final HireUserReqDto dto;

  const RejectUser({required this.dto});
}
