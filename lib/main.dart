import 'package:cosphere/src/config/app.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await initDependencies();
  SocketService().initialize();
  // await UserSharedPref.deleteUser();
  // await Hive.deleteBoxFromDisk(AppBoxesName.userBox);
  runApp(const App());
}
