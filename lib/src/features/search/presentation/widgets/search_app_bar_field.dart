import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/presentation/viewmodels/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAppBarField extends StatefulWidget {
  final FormFieldValidator<String>? validator;
  final ValueChanged<String> onSearch;
  final String? icon;
  final String? hintText;
  final String uid;
  const SearchAppBarField({
    required this.uid,
    required this.onSearch,
    super.key,
    this.validator,
    this.icon,
    this.hintText,
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

  void _onSubmitted(String query) {
    if (query.trim().isNotEmpty) {
      context.read<SearchBloc>().add(
            AddSearchHistory(
              dto: AddSearchHistoryReqDto(
                  userId: widget.uid, query: _searchController.text),
            ),
          );
      widget.onSearch(query);
      _searchController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 30,
      child: TextFormField(
        onFieldSubmitted: _onSubmitted,
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
