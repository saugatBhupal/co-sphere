import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/account_textspan.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/auth_message.dart';
import 'package:cosphere/src/features/authentication/presentation/widgets/forms/location_form.dart';
import 'package:cosphere/widgets/appbar/authentication_appbar.dart';
import 'package:cosphere/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/widgets/input_fields/input_field.dart';
import 'package:cosphere/widgets/input_fields/location_dropdown.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthenticationAppbar(),
                const SizedBox(height: 20),
                const AuthMessage(
                    title: AppStrings.locationTitle,
                    subtitle: AppStrings.signinSubtitle),
                const SizedBox(height: 40),
                const LocationForm(),
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
