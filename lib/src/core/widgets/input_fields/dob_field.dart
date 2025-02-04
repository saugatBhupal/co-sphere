import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/utils/auto_hypen_formattor.dart';
import 'package:cosphere/src/core/utils/form_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DobField extends StatelessWidget {
  final TextEditingController dobController;
  final String? hintText;
  final Color? color;
  final String? labelText;

  const DobField({
    super.key,
    required this.dobController,
    this.hintText,
    this.color,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return TextFormField(
      controller: dobController,
      keyboardType: TextInputType.datetime,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      cursorColor: AppColors.grey,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9\- ]')),
        AutoHyphenFormatter(),
        LengthLimitingTextInputFormatter(10),
      ],
      style: _textTheme.titleSmall!
          .copyWith(fontSize: 15, color: color ?? AppColors.midnight),
      decoration: InputDecoration(
        hintText: hintText ?? 'DD - MM - YYYY',
        labelText: labelText ?? AppStrings.dob,
      ),
      validator: (val) {
        return FormValidator.validateDOB(val);
      },
    );
  }
}
