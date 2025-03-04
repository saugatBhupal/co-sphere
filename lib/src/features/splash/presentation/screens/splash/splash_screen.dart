import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_constants.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppConstants.animationTime),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();
    Future.delayed(const Duration(milliseconds: AppConstants.navigateTime), () {
      if (mounted) {
        context.read<DashboardBloc>().add(StartUpAppEvent());
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DashboardBloc, DashboardState>(
      listener: (context, state) {
        if (state is DashboardGetUserSuccess && state.user != null) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.dashboard,
            (route) => false,
            arguments: state.user,
          );
        }
        if ((state is DashboardGetUserSuccess && state.user == null) ||
            state is DashboardGetUserFailed) {
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.onboarding,
            (route) => false,
          );
        }
      },
      child: Scaffold(
        body: SizedBox(
          width: context.width,
          height: context.height,
          child: FadeTransition(
            opacity: _animation,
            child: Stack(
              children: [
                _buildSplashImage(),
                Positioned(
                  bottom: context.height * 0.02,
                  right: context.width * 0.04,
                  child: _buildSplashBottomLogo(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Align _buildSplashBottomLogo(BuildContext context) {
  return const Align(
    alignment: Alignment.bottomRight,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppStrings.version,
          style: TextStyle(
            color: AppColors.midnight,
            fontFamily: AppFonts.albertSans,
            fontSize: 18,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
        Text(
          AppStrings.inaing,
          style: TextStyle(
            color: AppColors.midnight,
            fontFamily: AppFonts.albertSans,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1,
          ),
        ),
      ],
    ),
  );
}

Align _buildSplashImage() {
  return const Align(
    alignment: Alignment.center,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          width: 250,
          height: 180,
          fit: BoxFit.contain,
          image: AssetImage(AppImages.appLogo),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          AppStrings.appName,
          style: TextStyle(
            color: AppColors.midnight,
            fontFamily: AppFonts.albertSans,
            fontSize: 30,
            fontWeight: FontWeight.w800,
          ),
        )
      ],
    ),
  );
}
