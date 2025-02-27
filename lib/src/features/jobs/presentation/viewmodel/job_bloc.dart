import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/jobs/data/dto/apply_job/apply_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/data/dto/create_job/create_job_req_dto.dart';
import 'package:cosphere/src/features/jobs/domain/entities/job.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/apply_to_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/create_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/created_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_applied_jobs_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_explore_jobs_usecase.dart';
import 'package:equatable/equatable.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetAppliedJobsUsecase getAppliedJobsUsecase;
  final CreateJobUsecase createJobUsecase;
  final GetExploreJobsUsecase getExploreJobsUsecase;
  final ApplyToJobUsecase applyToJobUsecase;
  final CreatedJobUsecase createdJobUsecase;
  JobBloc({
    required this.getAppliedJobsUsecase,
    required this.createJobUsecase,
    required this.getExploreJobsUsecase,
    required this.applyToJobUsecase,
    required this.createdJobUsecase,
  }) : super(JobInitial()) {
    on<JobEvent>((event, emit) async {
      if (event is ChangeCreatedModule) {
        _changeCreatedModule(event, emit);
      }
      if (event is GetAppliedJob) {
        await _getAppliedJob(event, emit);
      }
      if (event is CreateJob) {
        await _createJob(event, emit);
      }
      if (event is GetExploreJobs) {
        await _getExploreJobs(event, emit);
      }
      if (event is ApplyToJob) {
        await _applyToJob(event, emit);
      }
      if (event is CreatedJobs) {
        await _allCreatedJobs(event, emit);
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

  List<Job> _createdJobs = [];
  List<Job> get createdJobs => _createdJobs;
  Future<void> _createJob(CreateJob event, Emitter<JobState> emit) async {
    emit(const CreateJobLoading());
    try {
      final result = await createJobUsecase(event.dto);
      result.fold(
        (failure) => emit(CreateJobFailed(message: failure.message)),
        (success) {
          _createdJobs.add(success);
          emit(CreateJobSuccess(job: success));
        },
      );
    } catch (e) {
      emit(CreateJobFailed(message: "Error: ${e.toString()}"));
    }
  }

  List<Job> _exploreJobs = [];
  List<Job> get exploreJobs => _exploreJobs;
  Future<void> _getExploreJobs(
      GetExploreJobs event, Emitter<JobState> emit) async {
    emit(const GetExploreJobsLoading());
    try {
      final result = await getExploreJobsUsecase(event.uid);
      result.fold(
        (failure) => emit(GetExploreJobsFailed(message: failure.message)),
        (success) {
          _exploreJobs = success;
          emit(GetExploreJobsSuccess(jobs: success));
        },
      );
    } catch (e) {
      emit(GetExploreJobsFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _applyToJob(ApplyToJob event, Emitter<JobState> emit) async {
    emit(const ApplyToJobLoading());
    try {
      final result = await applyToJobUsecase(event.dto);
      result.fold(
        (failure) => emit(ApplyToJobFailed(message: failure.message)),
        (success) {
          _exploreJobs.removeWhere((e) => e.id == success.id);
          _appliedJobs.add(success);
          emit(ApplyToJobSuccess(job: success));
        },
      );
    } catch (e) {
      emit(ApplyToJobFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _allCreatedJobs(
      CreatedJobs event, Emitter<JobState> emit) async {
    emit(const CreatedJobsLoading());
    try {
      final result = await createdJobUsecase(event.uid);
      result.fold(
        (failure) => emit(CreatedJobsFailed(message: failure.message)),
        (success) {
          _createdJobs = success;
          emit(CreatedJobsSuccess(job: success));
        },
      );
    } catch (e) {
      emit(CreatedJobsFailed(message: "Error: ${e.toString()}"));
    }
  }
}
