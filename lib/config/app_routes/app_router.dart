import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/config/app_routes/no_route_found.dart';
import 'package:cosphere/views/interests/interest_screen.dart';
import 'package:cosphere/views/onboarding/onboarding_screen.dart';
import 'package:cosphere/views/signin/signin_screen.dart';
import 'package:cosphere/views/signup/location_screen.dart';
import 'package:cosphere/views/signup/otp_screen.dart';
import 'package:cosphere/views/signup/password_screen.dart';
import 'package:cosphere/views/signup/signup_screen.dart';
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
      case AppRoutes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnboardingScreen());
      case AppRoutes.signin:
        return MaterialPageRoute(builder: (context) => const SigninScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (context) => const SignupScreen());
      case AppRoutes.location:
        return MaterialPageRoute(builder: (context) => const LocationScreen());
      case AppRoutes.otp:
        return MaterialPageRoute(builder: (context) => const OtpScreen());
      case AppRoutes.password:
        return MaterialPageRoute(builder: (context) => const PasswordScreen());
      case AppRoutes.interest:
        return MaterialPageRoute(builder: (context) => const InterestScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
