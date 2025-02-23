import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController emailController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;
  final Color? color;

  const EmailField({
    super.key,
    required this.emailController,
    required this.label,
    this.icon,
    this.color,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: _textTheme.titleSmall!.copyWith(
          fontSize: context.isTablet ? 18 : 15,
          color: color ?? AppColors.midnight),
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.email.toLowerCase()}",
        hintStyle: _textTheme.titleSmall!.copyWith(
          fontSize: context.isTablet ? 17 : 15,
          color: color ?? AppColors.dim,
          fontWeight: FontThickness.light,
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 10, left: 18),
                child: Image.asset(
                  icon!,
                  height: context.isTablet ? 26 : 24,
                  width: context.isTablet ? 26 : 24,
                  fit: BoxFit.contain,
                ),
              )
            : null,
        labelText: label,
        contentPadding: EdgeInsets.symmetric(
          vertical: context.isTablet ? 14 : 6,
          horizontal: 16,
        ),
      ),
    );
  }
}
