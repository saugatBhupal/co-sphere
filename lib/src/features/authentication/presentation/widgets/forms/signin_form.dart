import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/email_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/password_field.dart';
import 'package:flutter/material.dart';

class SigninForm extends StatefulWidget {
  const SigninForm({super.key});

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
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
    final _textTheme = Theme.of(context).textTheme;
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          Align(
            alignment: Alignment.centerRight,
            child: Text(AppStrings.forgot,
                style: _textTheme.titleLarge!.copyWith(
                    color: AppColors.midnight, fontWeight: FontWeight.w500)),
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
        ],
      ),
    );
  }
}