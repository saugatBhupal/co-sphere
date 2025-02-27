part of 'job_bloc.dart';

sealed class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class ChangeCreatedModule extends JobEvent {
  final int index;

  const ChangeCreatedModule({required this.index});
}

class GetAppliedJob extends JobEvent {
  final String uid;

  const GetAppliedJob({required this.uid});
}

class CreateJob extends JobEvent {
  final CreateJobReqDto dto;

  const CreateJob({required this.dto});
}

class GetExploreJobs extends JobEvent {
  final String uid;

  const GetExploreJobs({required this.uid});
}
class ApplyToJob extends JobEvent {
  final ApplyJobReqDto dto;

  const ApplyToJob({required this.dto});
}
