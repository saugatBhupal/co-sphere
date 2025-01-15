import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneField extends StatelessWidget {
  final TextEditingController phoneController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;
  final Color? color;

  const PhoneField({
    super.key,
    required this.phoneController,
    this.validator,
    required this.label,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: phoneController,
      keyboardType: TextInputType.number,
      cursorColor: AppColors.grey,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      style: _textTheme.titleSmall!
          .copyWith(fontSize: 15, color: color ?? AppColors.midnight),
      decoration: InputDecoration(
        hintText: "${AppStrings.enter} ${AppStrings.phone.toLowerCase()}",
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
        labelText: label,
      ),
    );
  }
}
