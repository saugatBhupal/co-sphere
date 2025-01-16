import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  _initCore();
}

void _initCore() {
  sl.registerLazySingleton<HiveService>(() => HiveService());
}
