import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_applied_jobs_usecase.dart';
import 'package:equatable/equatable.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetAppliedJobsUsecase getAppliedJobsUsecase;
  JobBloc({required this.getAppliedJobsUsecase}) : super(JobInitial()) {
    on<JobEvent>((event, emit) async {
      if (event is ChangeCreatedModule) {
        _changeCreatedModule(event, emit);
      }
      if (event is GetAppliedJob) {
        await _getAppliedJob(event, emit);
      }
    });
  }
  void _changeCreatedModule(ChangeCreatedModule event, Emitter<JobState> emit) {
    emit(CreatedModuleChanged(event.index));
  }

  List<Job> _appliedJobs = [];
  List<Job> get appliedJobs => _appliedJobs;
  Future<void> _getAppliedJob(
      GetAppliedJob event, Emitter<JobState> emit) async {
    emit(const GetAppliedJobLoading());
    try {
      final result = await getAppliedJobsUsecase(event.uid);
      result.fold(
          (failure) => emit(GetAppliedJobFailed(message: failure.message)),
          (success) {
        _appliedJobs = success;
        emit(GetAppliedJobSuccess(
            jobs: success.length >= 3 ? success.take(3).toList() : success));
      });
    } catch (e) {
      emit(GetAppliedJobFailed(message: "Error: ${e.toString()}"));
    }
  }
}
