import 'package:cosphere/src/config/app_routes/app_router.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: AppTheme.getAppTheme(),
    );
  }
}
