import 'package:cosphere/core/constants/app_colors.dart';
import 'package:cosphere/core/constants/app_fonts.dart';
import 'package:cosphere/core/constants/app_strings.dart';
import 'package:cosphere/core/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;

  const PhoneField({
    super.key,
    required this.phoneController,
    this.validator,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      style: const TextStyle(
        color: AppColors.midnight,
        fontFamily: AppFonts.albertSans,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.phone.toLowerCase()}",
        hintStyle: const TextStyle(
          color: AppColors.dim,
          fontFamily: AppFonts.albertSans,
          fontWeight: FontWeight.w300,
          fontSize: 14,
        ),
        prefix: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              AppStrings.code,
            ),
            const SizedBox(width: 8),
            Container(
              height: 20,
              width: 1,
              color: AppColors.dim,
            ),
            const SizedBox(width: 8),
          ],
        ),
        prefixStyle: const TextStyle(
          color: AppColors.grey,
          fontFamily: AppFonts.albertSans,
          fontSize: 16,
        ),
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
