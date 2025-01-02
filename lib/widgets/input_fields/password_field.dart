import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController passwordController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;

  const PasswordField({
    super.key,
    required this.passwordController,
    this.validator,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscuringCharacter: "•",
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        color: AppColors.midnight,
        fontFamily: AppFonts.albertSans,
        fontSize: 18,
        letterSpacing: -1,
      ),
      obscureText: true,
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.password.toLowerCase()}",
        hintStyle: const TextStyle(
          color: AppColors.dim,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
          letterSpacing: 0,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10, left: 18),
          child: Image.asset(
            icon!,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.grey,
          fontFamily: AppFonts.albertSans,
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.dim,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: const BorderSide(
            color: AppColors.red,
          ),
        ),
      ),
    );
  }
}
