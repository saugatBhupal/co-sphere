import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/config/app_routes/no_route_found.dart';
import 'package:cosphere/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.root:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
