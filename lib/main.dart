import 'package:cosphere/src/config/app.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/notification_config/notification_config.dart';
import 'package:cosphere/src/config/socket_config/socket_service.dart';
import 'package:cosphere/src/core/network/hive_service.dart';
import 'package:cosphere/src/core/shared_prefs.dart/user_shared_pref.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.init();
  await initDependencies();
  SocketService().initialize();
  await initializeNotifications();
  await UserSharedPref.deleteUser();
  runApp(const App());
}
