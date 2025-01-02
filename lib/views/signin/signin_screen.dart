import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/core/constants/app_assets.dart';
import 'package:cosphere/core/constants/app_colors.dart';
import 'package:cosphere/core/constants/app_fonts.dart';
import 'package:cosphere/core/constants/app_strings.dart';
import 'package:cosphere/core/utils/form_validator.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/email_field.dart';
import 'package:cosphere/widgets/input_fields/password_field.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 26),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AuthenticationAppbar(),
                  const SizedBox(height: 20),
                  const AuthMessage(
                      title: AppStrings.signinTitle,
                      subtitle: AppStrings.signinSubtitle),
                  const SizedBox(height: 40),
                  EmailField(
                    emailController: _emailController,
                    label: "${AppStrings.email}/${AppStrings.phone}",
                    icon: AppIcons.user,
                    validator: (val) {
                      return FormValidator.validateEmail(val);
                    },
                  ),
                  const SizedBox(height: 25),
                  PasswordField(
                    passwordController: _passwordController,
                    label: AppStrings.password,
                    icon: AppIcons.user,
                    validator: (value) => FormValidator.validatePassword(value),
                  ),
                  const SizedBox(height: 15),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      AppStrings.forgot,
                      style: TextStyle(
                        fontFamily: AppFonts.albertSans,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: AppColors.midnight,
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  DarkRoundedButton(
                    title: AppStrings.signin,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(AppRoutes.home);
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  AccountTextspan(
                    infoText: AppStrings.notHaveAccount,
                    functionText: AppStrings.signup,
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.signup),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
