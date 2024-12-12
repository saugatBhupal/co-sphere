import 'package:cosphere/config/app_routes/app_routes.dart';
import 'package:cosphere/constants/app_strings.dart';
import 'package:cosphere/constants/utils/form_validator.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/input_field.dart';
import 'package:cosphere/widgets/input_fields/location_dropdown.dart';
import 'package:cosphere/widgets/textSpan.dart/account_textspan.dart';
import 'package:cosphere/widgets/textSpan.dart/auth_message.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                      title: AppStrings.locationTitle,
                      subtitle: AppStrings.signinSubtitle),
                  const SizedBox(height: 40),
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
                          Navigator.of(context).pushNamed(AppRoutes.otp);
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
      ),
    );
  }
}
