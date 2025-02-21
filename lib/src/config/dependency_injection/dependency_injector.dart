import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:cosphere/src/core/network/connectivity_checker.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/core/network/http_service.dart';
import 'package:cosphere/src/features/authentication/auth_injector.dart';
import 'package:cosphere/src/features/chat/chat_injector.dart';
import 'package:cosphere/src/features/dashboard/dashboard_injector.dart';
import 'package:cosphere/src/features/jobs/job_injector.dart';
import 'package:cosphere/src/features/profile/profile_injector.dart';
import 'package:cosphere/src/features/project/project_injector.dart';
import 'package:cosphere/src/features/search/search_injector.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  initDash();
  initAuth();
  initProfile();
  initJob();
  initChat();
  initSearch();
  initProject();
}

void _initCore() {
  sl.registerSingleton<Dio>(Dio());

  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
      () => CheckInternetConnectivity(connectivity: sl()));

  sl.registerLazySingleton<HiveService>(() => HiveService());
  sl.registerLazySingleton<HttpService>(() => HttpService(Dio()));
  sl.registerLazySingleton<SocketService>(() => SocketService());
}
