import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateField extends StatelessWidget {
  final TextEditingController dateController;
  final String? hintText;
  final Color? color;
  final String? labelText;
  final ValueChanged<String> onDatePicked;

  const DateField({
    super.key,
    required this.dateController,
    this.hintText,
    this.color,
    this.labelText,
    required this.onDatePicked,
  });

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate =
          "${pickedDate.day.toString().padLeft(2, '0')} - ${pickedDate.month.toString().padLeft(2, '0')} - ${pickedDate.year}";
      onDatePicked(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: context.width / 2.3,
      child: GestureDetector(
        onTap: () => _selectDate(context),
        child: AbsorbPointer(
          child: TextFormField(
            controller: dateController,
            keyboardType: TextInputType.datetime,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            cursorColor: AppColors.grey,
            readOnly: true,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9\- ]')),
              LengthLimitingTextInputFormatter(10),
            ],
            style: _textTheme.bodyLarge!
                .copyWith(color: AppColors.grey, letterSpacing: 0),
            decoration: InputDecoration(
              hintText: hintText ?? 'DD - MM - YYYY',
              labelText: labelText ?? AppStrings.dob,
              suffixIcon: const Icon(
                Icons.calendar_month,
                color: AppColors.silver,
                size: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.grey.withOpacity(0.4),
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
