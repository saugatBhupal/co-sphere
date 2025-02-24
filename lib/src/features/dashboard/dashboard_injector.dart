import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dasboard_local_datasource_impl.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/local/dashboard_local_datasource.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource.dart';
import 'package:cosphere/src/features/dashboard/data/datasources/remote/dashboard_remote_datasource_impl.dart';
import 'package:cosphere/src/features/dashboard/data/repositories/dashboard_remote_repository.dart';
import 'package:cosphere/src/features/dashboard/domain/repositories/dasbboard_repository.dart';
import 'package:cosphere/src/features/dashboard/domain/usecases/get_user_usecase.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';

void initDash() {
  sl.registerLazySingleton<DashboardLocalDatasource>(
      () => DashboardLocalDatasourceImpl(hiveService: sl()));
  sl.registerLazySingleton<DashboardRemoteDatasource>(() =>
      DashboardRemoteDatasourceImpl(dio: sl(), dashboardLocalDatasource: sl()));
  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRemoteRepository(dashboardRemoteDatasource: sl()));
  sl.registerLazySingleton(() => GetUserUsecase(dashboardRepository: sl()));

  sl.registerFactory<DashboardBloc>(() => DashboardBloc(getUserUsecase: sl()));
}
