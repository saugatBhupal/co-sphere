import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;
  final String? hintText;
  final Color? color;

  const InputField({
    super.key,
    required this.textController,
    required this.label,
    this.icon,
    this.color,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: textController,
      keyboardType: TextInputType.name,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: _textTheme.titleSmall!
          .copyWith(fontSize: 15, color: color ?? AppColors.midnight),
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
      ),
    );
  }
}
