import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class LocationDropdown extends StatelessWidget {
  final String label;
  final String? icon;
  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onChanged;
  final FormFieldValidator<String>? validator;

  const LocationDropdown({
    super.key,
    required this.label,
    required this.items,
    this.selectedItem,
    required this.onChanged,
    this.validator,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: DropdownButtonFormField<String>(
        value: selectedItem,
        alignment: AlignmentDirectional.bottomEnd,
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "${AppStrings.enter} ${label.toLowerCase()}",
            style: _textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w300, color: AppColors.dim),
          ),
        ),
        validator: validator,
        elevation: 2,
        isExpanded: true,
        items: items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: _textTheme.bodyLarge!.copyWith(color: AppColors.grey),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        icon: const Icon(
          Icons.keyboard_arrow_down_sharp,
          color: AppColors.dim,
        ),
        borderRadius: BorderRadius.circular(12),
        dropdownColor: AppColors.satin,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
