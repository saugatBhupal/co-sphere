import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/forms/otp_form.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/auth_message.dart';

class OtpScreen extends StatelessWidget {
  final String email;
  const OtpScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AuthenticationAppbar(),
              const SizedBox(height: 20),
              const AuthMessage(
                  title: AppStrings.otpTitle, subtitle: AppStrings.otpSubtitle),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  email,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColors.midnight,
                        fontWeight: FontWeight.w500,
                        fontSize: context.isTablet ? 22 : 18,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              OtpForm(email: email),
              const SizedBox(height: 15),
              AccountTextspan(
                infoText: AppStrings.haveAccount,
                functionText: AppStrings.signin,
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.signin),
              )
            ],
          ),
        ),
      ),
    );
  }
}
