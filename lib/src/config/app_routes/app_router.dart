import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/app_routes/no_route_found.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/location_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/otp_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/password_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/signin/sign_in_bloc.dart';
import 'package:cosphere/src/features/chat/presentation/screens/chat_logs_screen.dart';
import 'package:cosphere/src/features/chat/presentation/screens/chat_room_screen.dart';
import 'package:cosphere/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cosphere/src/features/notification/presentation/screens/notifications_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/interest_screen.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/views/onboarding/onboarding_screen.dart';
import 'package:cosphere/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();
  static final _signUpBloc = sl<SignUpBloc>();
  static final _signInBloc = sl<SignInBloc>();
  static final _profileBloc = sl<ProfileBloc>();
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
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignInBloc>.value(
            value: _signInBloc,
            child: const SigninScreen(),
          ),
        );
      case AppRoutes.signup:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignUpBloc>.value(
            value: _signUpBloc,
            child: const SignupScreen(),
          ),
        );
      case AppRoutes.location:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignUpBloc>.value(
            value: _signUpBloc,
            child: LocationScreen(
              email: settings.arguments as String,
            ),
          ),
        );
      case AppRoutes.otp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignUpBloc>.value(
            value: _signUpBloc,
            child: OtpScreen(email: settings.arguments as String),
          ),
        );
      case AppRoutes.password:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignUpBloc>.value(
            value: _signUpBloc,
            child: PasswordScreen(email: settings.arguments as String),
          ),
        );
      case AppRoutes.interest:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SignUpBloc>.value(
            value: _signUpBloc,
            child:
                InterestScreen(params: settings.arguments as SignUpRequestDto),
          ),
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(
            builder: (context) =>
                DashboardScreen(user: settings.arguments as User));
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileBloc>.value(
            value: _profileBloc,
            child: ProfileScreen(user: settings.arguments as User),
          ),
        );
      case AppRoutes.editProfile:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ProfileBloc>.value(
            value: _profileBloc,
            child: EditProfileScreen(user: settings.arguments as User),
          ),
        );
      case AppRoutes.chatLogs:
        return MaterialPageRoute(builder: (context) => const ChatLogsScreen());
      case AppRoutes.chatRoom:
        return MaterialPageRoute(builder: (context) => const ChatRoomScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(
            builder: (context) => const NotificationsScreen());
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
