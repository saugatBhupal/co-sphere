import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/features/splash/data/datasources/local/splash_local_datasource.dart';
import 'package:cosphere/src/features/splash/data/datasources/local/splash_remote_datasource_impl.dart';
import 'package:cosphere/src/features/splash/data/datasources/remote/splash_remote_datasource.dart';
import 'package:cosphere/src/features/splash/data/datasources/remote/splash_remote_datasource_impl.dart';
import 'package:cosphere/src/features/splash/data/repositories/splash_remote_repository.dart';
import 'package:cosphere/src/features/splash/domain/repositories/splash_repository.dart';
import 'package:cosphere/src/features/splash/domain/usecases/get_current_user_usecase.dart';
import 'package:cosphere/src/features/splash/presentation/viewmodel/splash_bloc.dart';

void initSplash() {
  sl.registerLazySingleton<SplashLocalDatasource>(
      () => SplashLocalDatasourceImpl(hiveService: sl()));
  sl.registerLazySingleton<SplashRemoteDatasource>(
      () => SplashRemoteDatasourceImpl(dio: sl()));
  sl.registerLazySingleton<SplashRepository>(() => SplashRemoteRepository(
      splashRemoteDatasource: sl(),
      splashLocalDatasource: sl(),
      checkInternetConnectivity: sl()));
  sl.registerLazySingleton<GetCurrentUserUsecase>(
      () => GetCurrentUserUsecase(splashRepository: sl()));
  sl.registerFactory<SplashBloc>(() => SplashBloc(getCurrentUserUsecase: sl()));
}
