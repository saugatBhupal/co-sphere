import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/core/network/http_service.dart';
import 'package:cosphere/src/features/authentication/auth_injector.dart';
import 'package:cosphere/src/features/profile/profile_injector.dart';
import 'package:cosphere/src/features/splash/splash_injector.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  initSplash();
  initAuth();
  initProfile();
}

void _initCore() {
  sl.registerSingleton<Dio>(Dio());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
      () => CheckInternetConnectivity(connectivity: sl()));

  sl.registerLazySingleton<HiveService>(() => HiveService());
  sl.registerLazySingleton<HttpService>(() => HttpService(Dio()));
}
