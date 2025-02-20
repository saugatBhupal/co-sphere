import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class SearchAppBarField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final String? icon;
  final String? hintText;
  final VoidCallback? onTap;
  const SearchAppBarField({
    super.key,
    this.validator,
    this.icon,
    this.hintText,
    this.onTap,
  });

  @override
  State<SearchAppBarField> createState() => _SearchAppBarFieldState();
}

class _SearchAppBarFieldState extends State<SearchAppBarField> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
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
      height: 30,
      child: TextFormField(
        onTap: widget.onTap,
        controller: _searchController,
        validator: widget.validator,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.grey,
        style: _textTheme.bodyLarge!
            .copyWith(fontSize: 15, color: AppColors.midnight, height: 2),
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          hintText: widget.hintText ?? AppStrings.search,
          hintStyle: _textTheme.bodyLarge!
              .copyWith(color: AppColors.silver, fontSize: 16),
          isDense: true,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
