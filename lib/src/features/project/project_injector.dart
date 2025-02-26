import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/project/data/datasources/local/project_local_datasource.dart';
import 'package:cosphere/src/features/project/data/datasources/local/project_local_datasource_impl.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource.dart';
import 'package:cosphere/src/features/project/data/datasources/remote/project_remote_datasource_impl.dart';
import 'package:cosphere/src/features/project/data/repositories/project_remote_repository.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/add_review_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_project_usecse.dart';
import 'package:cosphere/src/features/project/domain/usecases/complete_task_usecase.dart';
import 'package:cosphere/src/features/jobs/domain/usecases/create_job_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_project_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/create_task_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/finish_hiring_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_active_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_applied_projects_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_completed_project_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_hiring_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_project_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_projects_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/get_review_by_id_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/hire_user_usecase.dart';
import 'package:cosphere/src/features/project/domain/usecases/reject_user_usecase.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';

void initProject() {
  sl.registerLazySingleton<ProjectLocalDatasource>(
      () => ProjectLocalDatasourceImpl());
  sl.registerLazySingleton<ProjectRemoteDatasource>(() =>
      ProjectRemoteDatasourceImpl(dio: sl(), projectLocalDatasource: sl()));
  sl.registerLazySingleton<ProjectRepository>(() => ProjectRemoteRepository(
      datasource: sl(),
      projectLocalDatasource: sl(),
      checkInternetConnectivity: sl()));
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
  sl.registerLazySingleton<GetProjectsUserUsecase>(
      () => GetProjectsUserUsecase(projectRepository: sl()));
  sl.registerLazySingleton<GetAppliedProjectsUsecase>(
      () => GetAppliedProjectsUsecase(projectRepository: sl()));
  sl.registerLazySingleton<AddReviewUsecase>(
      () => AddReviewUsecase(projectRepository: sl()));
  sl.registerLazySingleton<CompleteProjectUsecse>(
      () => CompleteProjectUsecse(projectRepository: sl()));
  sl.registerLazySingleton<GetReviewByIdUsecase>(
      () => GetReviewByIdUsecase(projectRepository: sl()));
  sl.registerLazySingleton<CreateProjectUsecase>(
      () => CreateProjectUsecase(projectRepository: sl()));
  sl.registerFactory<ProjectBloc>(() => ProjectBloc(
      getHiringProjectsUserUsecase: sl(),
      getActiveProjectUserUsecase: sl(),
      getCompletedProjectUserUsecase: sl(),
      getProjectByIdUsecase: sl(),
      hireUserUsecase: sl(),
      rejectUserUsecase: sl(),
      finishHiringUsecase: sl(),
      completeTaskUsecase: sl(),
      createTaskUsecase: sl(),
      getProjectsUserUsecase: sl(),
      getAppliedProjectsUsecase: sl(),
      addReviewUsecase: sl(),
      completeProjectUsecse: sl(),
      getReviewByIdUsecase: sl(),
      createProjectUsecase: sl()));
}
