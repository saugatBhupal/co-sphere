import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? icon;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  const SearchTextField({
    super.key,
    this.validator,
    this.icon,
    this.hintText,
    this.onChanged,
    this.onTap,
    this.controller,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _searchController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: context.isTablet ? 48 : 36,
      child: TextFormField(
        readOnly: true,
        onTap: widget.onTap,
        controller: _searchController,
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.grey,
        style: _textTheme.titleSmall!.copyWith(
            fontSize: context.isTablet ? 20 : 15,
            color: AppColors.midnight,
            height: 2),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: widget.hintText ?? AppStrings.searchPh,
          hintStyle: context.isTablet
              ? _textTheme.titleSmall!.copyWith(
                  color: AppColors.dim,
                  fontWeight: FontThickness.light,
                )
              : _textTheme.bodySmall,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10, left: 18),
            child: SvgPicture.asset(
              AppIcons.search,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: context.isTablet
                ? BorderRadius.circular(32)
                : BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: context.isTablet
                ? BorderRadius.circular(32)
                : BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: context.isTablet
                ? BorderRadius.circular(32)
                : BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
        ),
      ),
    );
  }
}
