import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource_impl.dart';
import 'package:cosphere/src/features/project/data/repositories/project_remote_repository.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_task_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_active_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_completed_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/reject_user_usecase.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';

void initProject() {
  sl.registerLazySingleton<ProjectRemoteDatasource>(
      () => ProjectRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<ProjectRepository>(
      () => ProjectRemoteRepository(datasource: sl()));
  sl.registerLazySingleton<GetHiringProjectsUserUsecase>(
      () => GetHiringProjectsUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<GetActiveProjectUserUsecase>(
      () => GetActiveProjectUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<GetCompletedProjectUserUsecase>(
      () => GetCompletedProjectUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<HireUserUsecase>(
      () => HireUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<RejectUserUsecase>(
      () => RejectUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<FinishHiringUsecase>(
      () => FinishHiringUsecase(projectRepository: sl()));
  sl.registerLazySingleton<GetProjectByIdUsecase>(
      () => GetProjectByIdUsecase(projectRepository: sl()));
  sl.registerLazySingleton<CompleteTaskUsecase>(
      () => CompleteTaskUsecase(projectRepository: sl()));
  sl.registerLazySingleton<CreateTaskUsecase>(
      () => CreateTaskUsecase(projectRepository: sl()));
  sl.registerFactory<ProjectBloc>(() => ProjectBloc(
      getHiringProjectsUserUsecase: sl(),
      getActiveProjectUserUsecase: sl(),
      getCompletedProjectUserUsecase: sl(),
      getProjectByIdUsecase: sl(),
      hireUserUsecase: sl(),
      rejectUserUsecase: sl(),
      finishHiringUsecase: sl(),
      completeTaskUsecase: sl(),
      createTaskUsecase: sl()));
}
