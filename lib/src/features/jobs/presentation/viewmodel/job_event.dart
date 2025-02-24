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
