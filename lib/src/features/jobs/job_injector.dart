import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource.dart';
import 'package:cosphere/src/features/jobs/data/datasources/remote/job_remote_datasource_impl.dart';
import 'package:cosphere/src/features/jobs/data/repositories/job_remote_repository.dart';
import 'package:cosphere/src/features/jobs/domain/repositories/job_repository.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';

void initJob() {
  sl.registerLazySingleton<JobRemoteDatasource>(
      () => JobRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<JobRepository>(
      () => JobRemoteRepository(datasource: sl()));
  sl.registerFactory<JobBloc>(() => JobBloc());
}
