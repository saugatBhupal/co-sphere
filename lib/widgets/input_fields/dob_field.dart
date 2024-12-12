import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
import 'package:cosphere/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DobField extends StatelessWidget {
  final TextEditingController dobController;
  final String? hintText;

  const DobField({
    super.key,
    required this.dobController,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: dobController,
      keyboardType: TextInputType.datetime,
      cursorColor: AppColors.grey,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'\d| - ')),
        LengthLimitingTextInputFormatter(12),
      ],
      style: const TextStyle(
        color: AppColors.midnight,
        fontFamily: AppFonts.albertSans,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText ?? 'DD - MM - YYYY',
        hintStyle: const TextStyle(
          color: AppColors.dim,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: AppStrings.dob,
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
            color: AppColors.midnight,
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Date of birth is required';
        }
        final regex = RegExp(r'^\d{2} - \d{2} - \d{4}$');
        if (!regex.hasMatch(value)) {
          return 'Invalid format. Use DD - MM - YYYY';
        }
        return null;
      },
    );
  }
}
