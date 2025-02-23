import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
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
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: passwordController,
      obscuringCharacter: "•",
      keyboardType: TextInputType.visiblePassword,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: _textTheme.titleSmall!.copyWith(
          fontSize: context.isTablet ? 18 : 15, color: AppColors.midnight),
      obscureText: true,
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.password.toLowerCase()}",
        hintStyle: _textTheme.titleSmall!.copyWith(
          fontSize: context.isTablet ? 17 : 15,
          color: AppColors.dim,
          fontWeight: FontThickness.light,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 10, left: 18),
          child: Image.asset(
            icon!,
            height: context.isTablet ? 26 : 24,
            width: context.isTablet ? 26 : 24,
            fit: BoxFit.contain,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: context.isTablet ? 14 : 6,
          horizontal: 16,
        ),
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
