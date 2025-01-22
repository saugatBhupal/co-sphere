import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/features/authentication/auth_injector.dart';
import 'package:cosphere/src/features/profile/profile_injector.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
  initAuth();
  initProfile();
}

void _initCore() {
  sl.registerLazySingleton<HiveService>(() => HiveService());
}
