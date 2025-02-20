import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource.dart';
import 'package:cosphere/src/features/search/data/datasources/remote/search_remote_datasource_impl.dart';
import 'package:cosphere/src/features/search/data/repositories/search_remote_repository.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/add_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_jobs_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_project_by_name_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_search_history_usecase.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_users_by_name_usecase.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';

void initSearch() {
  sl.registerLazySingleton<SearchRemoteDatasource>(
      () => SearchRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<SearchRepository>(
      () => SearchRemoteRepository(datasource: sl()));
  sl.registerLazySingleton<GetSearchHistoryUsecase>(
      () => GetSearchHistoryUsecase(searchRepository: sl()));
  sl.registerLazySingleton<AddSearchHistoryUsecase>(
      () => AddSearchHistoryUsecase(searchRepository: sl()));
  sl.registerLazySingleton<GetUsersByNameUsecase>(
      () => GetUsersByNameUsecase(searchRepository: sl()));
  sl.registerLazySingleton<GetJobsByNameUsecase>(
      () => GetJobsByNameUsecase(searchRepository: sl()));
  sl.registerLazySingleton<GetProjectByNameUsecase>(
      () => GetProjectByNameUsecase(searchRepository: sl()));
  sl.registerFactory<SearchBloc>(() => SearchBloc(
      getSearchHistoryUsecase: sl(),
      addSearchHistoryUsecase: sl(),
      getUsersByNameUsecase: sl(),
      getJobsByNameUsecase: sl(),
      getProjectByNameUsecase: sl()));
}
