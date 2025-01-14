import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LinkField extends StatelessWidget {
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;
  final String? hintText;

  LinkField({
    super.key,
    required this.textController,
    required this.label,
    this.icon,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 42,
      child: TextFormField(
        controller: textController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: AppColors.midnight,
        validator: validator,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: _textTheme.titleSmall!.copyWith(
          fontSize: 15,
          color: AppColors.winter,
          fontWeight: FontThickness.regular,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? "${AppStrings.enter} ${label.toLowerCase()}",
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
          labelText: label,
          labelStyle: _textTheme.bodyLarge!.copyWith(
            color: AppColors.grey,
            fontWeight: FontThickness.regular,
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
        ),
      ),
    );
  }
}
