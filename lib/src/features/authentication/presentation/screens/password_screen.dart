import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/auth_message.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/forms/password_form.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
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
              const PasswordForm(),
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
