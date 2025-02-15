// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/functions/build_toast.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/custom_dropdown.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';

class LocationForm extends StatefulWidget {
  final String email;
  const LocationForm({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  late final TextEditingController _cityController;
  final _formKey = GlobalKey<FormState>();

  List<String> countries = ["India", "Nepal", "China"];
  List<String> provinces = ["Province 1", "Province 2", "Province 3"];

  String? selectedCountry;
  String? selectedProvince;

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
  }

  @override
  void dispose() {
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is AuthSignupError) {
          buildToast(toastType: ToastType.error, msg: state.message);
          Navigator.of(context).pop();
        }
        if (state is AuthSignUpSuccess) {
          buildToast(
            toastType: ToastType.success,
            msg: state.message,
          );
          Navigator.of(context).pushNamedAndRemoveUntil(
            AppRoutes.otp,
            (route) => false,
            arguments: widget.email,
          );
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomDropdown(
                label: AppStrings.country,
                items: countries,
                onChanged: (value) {
                  setState(() {
                    selectedCountry = value;
                  });
                },
                validator: (value) =>
                    FormValidator.validateTitle(value, AppStrings.country),
              ),
              const SizedBox(height: 30),
              CustomDropdown(
                label: AppStrings.province,
                items: provinces,
                onChanged: (value) {
                  setState(() {
                    selectedProvince = value;
                  });
                },
                validator: (value) =>
                    FormValidator.validateTitle(value, AppStrings.province),
              ),
              const SizedBox(height: 30),
              InputField(
                textController: _cityController,
                label: AppStrings.city,
                validator: (value) =>
                    FormValidator.validateTitle(value, AppStrings.city),
              ),
              const SizedBox(height: 45),
              if (state is AuthSignUpLoading)
                const DarkRoundedButton(
                  isLoading: true,
                  title: AppStrings.continueBtn,
                  onPressed: null,
                ),
              if (state is! AuthSignUpLoading)
                DarkRoundedButton(
                  isLoading: false,
                  title: AppStrings.continueBtn,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final currentState = context.read<SignUpBloc>().state;
                      if (currentState is SignUpUpdating) {
                        context.read<SignUpBloc>().add(
                              AuthSignUp(
                                params: currentState.params.copyWith(
                                  country: selectedCountry ?? "",
                                  province: selectedProvince ?? "",
                                  city: _cityController.text
                                      .split(' ')
                                      .map((word) => word.isNotEmpty
                                          ? word[0].toUpperCase() +
                                              word.substring(1).toLowerCase()
                                          : '')
                                      .join(' '),
                                ),
                              ),
                            );
                      }
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
