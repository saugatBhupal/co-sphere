import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/password_field.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    title: AppStrings.passwordTitle,
                    subtitle: AppStrings.passSubtitle),
                const SizedBox(height: 40),
                PasswordField(
                  passwordController: _passwordController,
                  label: AppStrings.password,
                  icon: AppIcons.user,
                  validator: (val) => FormValidator.validatePassword(val),
                ),
                const SizedBox(height: 30),
                PasswordField(
                  passwordController: _confirmController,
                  label: "${AppStrings.confirm} ${AppStrings.password}",
                  icon: AppIcons.user,
                  validator: (val) => FormValidator.validateConfirmPassword(
                      val, _passwordController.text),
                ),
                const SizedBox(height: 40),
                DarkRoundedButton(
                    title: AppStrings.continueBtn,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(AppRoutes.interest);
                      }
                    }),
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
