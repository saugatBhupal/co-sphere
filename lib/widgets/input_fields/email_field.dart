import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
import 'package:cosphere/constants/app_strings.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;

  const EmailField({
    super.key,
    required this.emailController,
    required this.label,
    this.icon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(
        color: AppColors.midnight,
        fontFamily: AppFonts.albertSans,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.email.toLowerCase()}",
        hintStyle: const TextStyle(
          color: AppColors.dim,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 10, left: 18),
                child: Image.asset(
                  icon!,
                  height: 24,
                  width: 24,
                  fit: BoxFit.contain,
                ),
              )
            : null,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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
