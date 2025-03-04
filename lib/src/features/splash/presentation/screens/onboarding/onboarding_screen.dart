import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/buttons/light_rounded_button.dart';
import 'package:cosphere/src/features/splash/presentation/widgets/intro_slider.dart';
import 'package:cosphere/src/core/widgets/buttons/skip_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppStrings.welcome,
                            style: context.isTablet
                                ? _textTheme.headlineLarge!.copyWith(
                                    color: AppColors.grey,
                                    fontWeight: FontThickness.medium)
                                : _textTheme.titleSmall!
                                    .copyWith(color: AppColors.grey),
                          ),
                          TextSpan(
                            text: AppStrings.appName,
                            style: context.isTablet
                                ? _textTheme.headlineLarge!.copyWith(
                                    color: AppColors.midnight,
                                    fontWeight: FontThickness.medium)
                                : _textTheme.titleMedium!
                                    .copyWith(color: AppColors.midnight),
                          ),
                        ],
                      ),
                    ),
                    const SkipButton(),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  AppStrings.onboardMsg,
                  style: TextStyle(
                    fontFamily: AppFonts.albertSans,
                    fontSize: 44,
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: -1,
                  ),
                ),
                const SizedBox(height: 20),
                const IntroSlider(),
                SizedBox(height: context.isTablet ? 30 : 20),
                DarkRoundedButton(
                  title: AppStrings.findService,
                  icon: AppIcons.briefcase,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.signup),
                ),
                const SizedBox(height: 10),
                LightRoundedButton(
                  title: AppStrings.becomeFreelancer,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.signup),
                ),
                const SizedBox(height: 30),
                AccountTextspan(
                  fontSize: context.isTablet ? 22 : 17,
                  infoText: AppStrings.haveAccount,
                  functionText: AppStrings.signin,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.signin),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
