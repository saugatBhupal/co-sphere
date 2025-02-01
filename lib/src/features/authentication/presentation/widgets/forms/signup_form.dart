import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/dob_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/email_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/phone_field.dart';
import 'package:cosphere/src/features/authentication/data/dto/sign_up/sign_up_request_dto.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    context.read<SignUpBloc>().add(
                          UpdateSignUpRequestDto(
                            SignUpRequestDto(
                              email: _emailController.text,
                              fullname: _nameController.text
                                  .split(' ')
                                  .map((word) => word.isNotEmpty
                                      ? word[0].toUpperCase() +
                                          word.substring(1).toLowerCase()
                                      : '')
                                  .join(' '),
                              phone: _phoneController.text,
                              dob: DateFormat('dd-MM-yyyy')
                                  .parse(_dobController.text),
                              country: "",
                              province: "",
                              city: "",
                            ),
                          ),
                        );

                    Navigator.of(context).pushNamed(
                      AppRoutes.location,
                      arguments: _emailController.text,
                    );
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
