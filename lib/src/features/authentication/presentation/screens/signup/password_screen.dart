import 'package:flutter/material.dart';
import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/forms/password_form.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/textspan/auth_message.dart';

class PasswordScreen extends StatelessWidget {
  final String email;
  const PasswordScreen({
    Key? key,
    required this.email,
  }) : super(key: key);

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
                  title: AppStrings.passwordTitle,
                  subtitle: AppStrings.passSubtitle),
              const SizedBox(height: 40),
              PasswordForm(email: email),
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
