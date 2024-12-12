import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/constants/app_strings.dart';
import 'package:cosphere/constants/utils/form_validator.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/dob_field.dart';
import 'package:cosphere/widgets/input_fields/email_field.dart';
import 'package:cosphere/widgets/input_fields/input_field.dart';
import 'package:cosphere/widgets/input_fields/phone_field.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _nameController;
  late final TextEditingController _phoneController;
  late final TextEditingController _dobController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _nameController = TextEditingController();
    _phoneController = TextEditingController();
    _dobController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
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
                    title: AppStrings.signupTitle,
                    subtitle: AppStrings.signinSubtitle,
                  ),
                  const SizedBox(height: 40),
                  EmailField(
                    emailController: _emailController,
                    label: AppStrings.email,
                    validator: (val) {
                      return FormValidator.validateEmail(val);
                    },
                  ),
                  const SizedBox(height: 25),
                  InputField(
                    textController: _nameController,
                    label: AppStrings.name,
                    validator: (val) {
                      return FormValidator.validateTitle(val, AppStrings.name);
                    },
                  ),
                  const SizedBox(height: 25),
                  PhoneField(
                    phoneController: _phoneController,
                    label: AppStrings.phone,
                    validator: (val) {
                      return FormValidator.validateTitle(val, AppStrings.phone);
                    },
                  ),
                  const SizedBox(height: 25),
                  DobField(dobController: _dobController),
                  const SizedBox(height: 45),
                  DarkRoundedButton(
                    title: AppStrings.continueBtn,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushNamed(AppRoutes.location);
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  AccountTextspan(
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
      ),
    );
  }
}
