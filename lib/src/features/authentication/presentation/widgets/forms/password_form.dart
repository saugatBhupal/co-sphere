import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/password_field.dart';
import 'package:flutter/material.dart';

class PasswordForm extends StatefulWidget {
  const PasswordForm({super.key});

  @override
  State<PasswordForm> createState() => _PasswordFormState();
}

class _PasswordFormState extends State<PasswordForm> {
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
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
        ],
      ),
    );
  }
}
