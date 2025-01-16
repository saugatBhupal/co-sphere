import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:cosphere/src/core/widgets/input_fields/location_dropdown.dart';
import 'package:cosphere/src/features/authentication/presentation/viewmodels/bloc/sign_up_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationForm extends StatefulWidget {
  const LocationForm({super.key});

  @override
  State<LocationForm> createState() => _LocationFormState();
}

class _LocationFormState extends State<LocationForm> {
  late final TextEditingController _cityController;
  final _formKey = GlobalKey<FormState>();
  List<String> countries = ["India", "Nepal", "China"];
  List<String> provinces = ["India", "Nepal", "China"];
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LocationDropdown(
                label: AppStrings.country,
                items: countries,
                onChanged: (value) {
                  selectedCountry = value;
                },
                validator: (value) =>
                    FormValidator.validateTitle(value, AppStrings.country),
              ),
              const SizedBox(height: 30),
              LocationDropdown(
                label: AppStrings.province,
                items: provinces,
                onChanged: (value) {
                  selectedProvince = value;
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
              DarkRoundedButton(
                title: AppStrings.continueBtn,
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final address = [
                      selectedCountry,
                      selectedProvince,
                      _cityController.text,
                    ]
                        .where(
                            (element) => element != null && element.isNotEmpty)
                        .join(', ');
                    context.read<SignUpBloc>().add(UpdateSignupParams(
                          state.params.copyWith(address: address),
                        ));
                    Navigator.of(context).pushNamed(AppRoutes.otp);
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
