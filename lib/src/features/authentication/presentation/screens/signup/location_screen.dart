import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/auth_message.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/forms/location_form.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/appbar/authentication_appbar.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthenticationAppbar(),
                const SizedBox(height: 20),
                const AuthMessage(
                    title: AppStrings.locationTitle,
                    subtitle: AppStrings.signinSubtitle),
                const SizedBox(height: 40),
                const LocationForm(),
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
      ),
    );
  }
}
