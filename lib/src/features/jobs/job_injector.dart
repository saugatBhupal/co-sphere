import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/jobs/data/datasources/local/job_local_datasource.dart';
import 'package:cosphere/src/features/jobs/data/datasources/local/job_local_datasource_impl.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource_impl.dart';
import 'package:cosphere/src/features/jobs/data/repositories/job_remote_repository.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/apply_to_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/create_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/created_job_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_applied_jobs_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_explore_jobs_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/get_job_by_id_usecase.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';

void initJob() {
  sl.registerLazySingleton<JobLocalDatasource>(() => JobLocalDatasourceImpl());
  sl.registerLazySingleton<JobRemoteDatasource>(
      () => JobRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<JobRepository>(() => JobRemoteRepository(
      datasource: sl(),
      localDatasource: sl(),
      checkInternetConnectivity: sl()));
  sl.registerLazySingleton<GetAppliedJobsUsecase>(
      () => GetAppliedJobsUsecase(jobRepository: sl()));
  sl.registerLazySingleton<CreateJobUsecase>(
      () => CreateJobUsecase(jobRepository: sl()));
  sl.registerLazySingleton<GetExploreJobsUsecase>(
      () => GetExploreJobsUsecase(jobRepository: sl()));
  sl.registerLazySingleton<ApplyToJobUsecase>(
      () => ApplyToJobUsecase(jobRepository: sl()));
  sl.registerLazySingleton<CreatedJobUsecase>(
      () => CreatedJobUsecase(jobRepository: sl()));
  sl.registerLazySingleton<GetJobByIdUsecase>(
      () => GetJobByIdUsecase(jobRepository: sl()));
  sl.registerFactory<JobBloc>(() => JobBloc(
      getAppliedJobsUsecase: sl(),
      createJobUsecase: sl(),
      getExploreJobsUsecase: sl(),
      applyToJobUsecase: sl(),
      createdJobUsecase: sl(),
      getJobByIdUsecase: sl()));
}
