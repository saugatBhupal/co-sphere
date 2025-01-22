import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchTextField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? icon;
  const SearchTextField({
    super.key,
    this.validator,
    this.icon,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 36,
      child: TextFormField(
        controller: _searchController,
        validator: widget.validator,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.grey,
        style: _textTheme.titleSmall!
            .copyWith(fontSize: 15, color: AppColors.midnight, height: 2),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: AppStrings.searchPh,
          hintStyle: _textTheme.bodySmall,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10, left: 18),
            child: SvgPicture.asset(
              AppIcons.search,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
        ),
      ),
    );
  }
}
