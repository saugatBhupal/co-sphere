part of 'job_bloc.dart';

sealed class JobState extends Equatable {
  const JobState();

  @override
  List<Object> get props => [];
}

final class JobInitial extends JobState {}

class CreatedModuleChanged extends JobState {
  final int index;
  const CreatedModuleChanged(this.index);

  @override
  List<Object> get props => [index];
}

class GetAppliedJobLoading extends JobState {
  const GetAppliedJobLoading();
}

class GetAppliedJobSuccess extends JobState {
  final List<Job> jobs;
  const GetAppliedJobSuccess({required this.jobs});
}

class GetAppliedJobFailed extends JobState {
  final String message;
  const GetAppliedJobFailed({required this.message});
}

class CreateJobLoading extends JobState {
  const CreateJobLoading();
}

class CreateJobSuccess extends JobState {
  final Job job;
  const CreateJobSuccess({required this.job});
}

class CreateJobFailed extends JobState {
  final String message;
  const CreateJobFailed({required this.message});
}
