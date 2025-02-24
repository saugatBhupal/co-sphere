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

class AcceptingUserLoading extends ProjectState {
  const AcceptingUserLoading();
}

class HireUserSuccess extends ProjectState {
  final Project project;
  const HireUserSuccess({required this.project});
}

class HireUserFailed extends ProjectState {
  final String message;
  const HireUserFailed({required this.message});
}

class RejectUserSuccess extends ProjectState {
  final Applicants applicant;
  const RejectUserSuccess({required this.applicant});
}

class RejectUserFailed extends ProjectState {
  final String message;
  const RejectUserFailed({required this.message});
}

class FinishHireLoading extends ProjectState {
  const FinishHireLoading();
}

class FinishHireSuccess extends ProjectState {
  final String message;
  const FinishHireSuccess({required this.message});
}

class FinishHireFailed extends ProjectState {
  final String message;
  const FinishHireFailed({required this.message});
}

class CompleteTaskLoading extends ProjectState {
  const CompleteTaskLoading();
}

class CompleteTaskSuccess extends ProjectState {
  final Tasks task;
  const CompleteTaskSuccess({required this.task});
}

class CompleteTaskFailed extends ProjectState {
  final String message;
  const CompleteTaskFailed({required this.message});
}

class CreateTaskLoading extends ProjectState {
  const CreateTaskLoading();
}

class CreateTaskSuccess extends ProjectState {
  final Tasks task;
  const CreateTaskSuccess({required this.task});
}

class CreateTaskFailed extends ProjectState {
  final String message;
  const CreateTaskFailed({required this.message});
}

class GetProjectByUserLoading extends ProjectState {
  const GetProjectByUserLoading();
}

class GetProjectByUserSuccess extends ProjectState {
  final List<Project> projects;
  const GetProjectByUserSuccess({required this.projects});
}

class GetProjectByUserFailed extends ProjectState {
  final String message;
  const GetProjectByUserFailed({required this.message});
}

class GetAppliedProjectLoading extends ProjectState {
  const GetAppliedProjectLoading();
}

class GetAppliedProjectSuccess extends ProjectState {
  final List<Project> projects;
  const GetAppliedProjectSuccess({required this.projects});
}

class GetAppliedProjectFailed extends ProjectState {
  final String message;
  const GetAppliedProjectFailed({required this.message});
}

class AddReviewLoading extends ProjectState {
  const AddReviewLoading();
}

class AddReviewSuccess extends ProjectState {
  final List<Reviews> reviews;
  const AddReviewSuccess({required this.reviews});
}

class AddReviewFailed extends ProjectState {
  final String message;
  const AddReviewFailed({required this.message});
}

class CompleteProjectLoading extends ProjectState {
  const CompleteProjectLoading();
}

class CompleteProjectSuccess extends ProjectState {
  final String message;
  const CompleteProjectSuccess({required this.message});
}

class CompleteProjectFailed extends ProjectState {
  final String message;
  const CompleteProjectFailed({required this.message});
}

class GetReviewByIdLoading extends ProjectState {
  const GetReviewByIdLoading();
}

class GetReviewByIdSuccess extends ProjectState {
  final Reviews reviews;
  const GetReviewByIdSuccess({required this.reviews});
}

class GetReviewByIdFailed extends ProjectState {
  final String message;
  const GetReviewByIdFailed({required this.message});
}
