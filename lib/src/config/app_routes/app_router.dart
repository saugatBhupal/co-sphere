import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/config/app_routes/no_route_found.dart';
import 'package:cosphere/src/config/dependency_injection/dependency_injector.dart';
import 'package:cosphere/src/config/screen_args.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signin/signin_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/location_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/otp_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/password_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/signup/signup_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/signin/sign_in_bloc.dart';
import 'package:cosphere/src/features/chat/presentation/screens/chat_logs_screen.dart';
import 'package:cosphere/src/features/chat/presentation/screens/chat_room_screen.dart';
import 'package:cosphere/src/features/chat/presentation/viewmodel/chat_bloc.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:cosphere/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:cosphere/src/features/explore/presentation/screens/explore_project_screen.dart';
import 'package:cosphere/src/features/jobs/presentation/screens/user_job_screen.dart';
import 'package:cosphere/src/features/jobs/presentation/screens/create_job_screen.dart';
import 'package:cosphere/src/features/notification/presentation/viewmodel/notification_bloc.dart';
import 'package:cosphere/src/features/project/presentation/screens/assigned_task_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/create_project_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/created_projects_screen.dart';
import 'package:cosphere/src/features/jobs/presentation/screens/job_details_screen.dart';
import 'package:cosphere/src/features/jobs/presentation/viewmodel/job_bloc.dart';
import 'package:cosphere/src/features/notification/presentation/screens/notifications_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:cosphere/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:cosphere/src/features/authentication/presentation/screens/interest_screen.dart';
import 'package:cosphere/src/features/profile/presentation/viewmodels/profile_bloc.dart';
import 'package:cosphere/src/features/project/presentation/screens/active_dashboard_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/applicants_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/completed_dashboard_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/hiring_dashboard_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/members_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/project_applications_screen.dart';
import 'package:cosphere/src/features/project/presentation/screens/project_details_screen.dart';
import 'package:cosphere/src/features/project/presentation/viewmodels/project_bloc.dart';
import 'package:cosphere/src/features/search/presentation/screens/search_screen.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:cosphere/src/features/splash/presentation/screens/onboarding/onboarding_screen.dart';
import 'package:cosphere/src/features/splash/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  AppRouter._();
  static final _signUpBloc = sl<SignUpBloc>();
  static final _signInBloc = sl<SignInBloc>();
  static final _profileBloc = sl<ProfileBloc>();
  static final _dashBloc = sl<DashboardBloc>();
  static final _projectBloc = sl<ProfileBloc>();
  static final _jobBloc = sl<JobBloc>();
  static final _chatBloc = sl<ChatBloc>();
  static final _notificationBloc = sl<NotificationBloc>();
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _dashBloc,
            child: const SplashScreen(),
          ),
        );
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
            child: LocationScreen(email: settings.arguments as String),
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
            child: const InterestScreen(),
          ),
        );
      case AppRoutes.dashboard:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<DashboardBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ProfileBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ProjectBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<JobBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<NotificationBloc>(),
              ),
            ],
            child: DashboardScreen(user: settings.arguments as User),
          ),
        );
      case AppRoutes.profile:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<ProfileBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ChatBloc>(),
              ),
            ],
            child: ProfileScreen(uid: settings.arguments as String),
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
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ChatBloc>.value(
            value: _chatBloc,
            child: ChatLogsScreen(user: settings.arguments as User),
          ),
        );
      case AppRoutes.chatRoom:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<ChatBloc>.value(
            value: _chatBloc,
            child: ChatRoomScreen(
                chatScreensArgs: settings.arguments as ChatScreensArgs),
          ),
        );
      case AppRoutes.notifications:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _notificationBloc,
                child: NotificationsScreen(user: settings.arguments as User)));
      case AppRoutes.userJobs:
        return MaterialPageRoute(
            builder: (context) => UserJobScreen(
                screenArgs: settings.arguments as UserJobsScreenArgs));
      case AppRoutes.projectApplications:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: ProjectApplicationsScreen(
                    user: settings.arguments as User)));
      case AppRoutes.createdProjects:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child:
                    CreatedProjectsScreen(user: settings.arguments as User)));
      case AppRoutes.assignedTasks:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: AssignedTaskScreen(
                    screenArgs: settings.arguments as AssignedTaskScreenArgs)));
      case AppRoutes.jobDetails:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _jobBloc,
                child: JobDetailsScreen(
                    screenArgs: settings.arguments as JobScreenArgs)));
      case AppRoutes.projectDetails:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _profileBloc,
                child: ProjectDetailsScreen(
                    screenArgs: settings.arguments as ProjectScreenArgs)));
      case AppRoutes.hiring:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: HiringDashboardScreen(
                    screenArgs: settings.arguments as ProjectScreenArgs)));
      case AppRoutes.active:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: ActiveDashboardScreen(
                    screensArgs: settings.arguments as ActiveScreensArgs)));
      case AppRoutes.completed:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: CompletedDashboardScreen(
                    projectId: settings.arguments as String)));
      case AppRoutes.applicants:
        return MaterialPageRoute(
            builder: (context) => ApplicantsScreen(
                screenArgs: settings.arguments as ApplicantsScreenArgs));
      case AppRoutes.members:
        return MaterialPageRoute(builder: (context) => const MembersScreen());
      case AppRoutes.createProject:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: CreateProjectScreen(user: settings.arguments as User)));
      case AppRoutes.createJob:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: CreateJobScreen(user: settings.arguments as User)));
      case AppRoutes.search:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => sl<SearchBloc>(),
              ),
              BlocProvider(
                create: (context) => sl<ChatBloc>(),
              ),
            ],
            child: SearchScreen(user: settings.arguments as User),
          ),
        );
      case AppRoutes.explore:
        return MaterialPageRoute(
            builder: (context) => BlocProvider.value(
                value: _projectBloc,
                child: ExploreProjectScreen(user: settings.arguments as User)));
      default:
        return MaterialPageRoute(
          builder: (context) => const NoRouteFound(),
        );
    }
  }
}
