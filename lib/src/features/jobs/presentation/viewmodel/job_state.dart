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

class GetExploreJobsLoading extends JobState {
  const GetExploreJobsLoading();
}

class GetExploreJobsSuccess extends JobState {
  final List<Job> jobs;
  const GetExploreJobsSuccess({required this.jobs});
}

class GetExploreJobsFailed extends JobState {
  final String message;
  const GetExploreJobsFailed({required this.message});
}

class ApplyToJobLoading extends JobState {
  const ApplyToJobLoading();
}

class ApplyToJobSuccess extends JobState {
  final Job job;
  const ApplyToJobSuccess({required this.job});
}

class ApplyToJobFailed extends JobState {
  final String message;
  const ApplyToJobFailed({required this.message});
}

class CreatedJobsLoading extends JobState {
  const CreatedJobsLoading();
}

class CreatedJobsSuccess extends JobState {
  final List<Job> job;
  const CreatedJobsSuccess({required this.job});
}

class CreatedJobsFailed extends JobState {
  final String message;
  const CreatedJobsFailed({required this.message});
}

class GetJobByIdLoading extends JobState {
  const GetJobByIdLoading();
}

class GetJobByIdSuccess extends JobState {
  final Job job;
  const GetJobByIdSuccess({required this.job});
}

class GetJobByIdFailed extends JobState {
  final String message;
  const GetJobByIdFailed({required this.message});
}
