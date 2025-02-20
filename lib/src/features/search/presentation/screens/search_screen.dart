import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/features/search/presentation/widgets/search_app_bar_field.dart';
import 'package:cosphere/src/features/search/presentation/widgets/search_results_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        shape: const Border(
            bottom: BorderSide(color: AppColors.plaster, width: 1)),
        title: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_outlined),
              onPressed: () => Navigator.of(context).pop(),
              padding: const EdgeInsets.only(left: 20),
              constraints: const BoxConstraints(),
            ),
            const Expanded(
              child: SearchAppBarField(),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SvgPicture.asset(
                AppIcons.search,
                height: 24,
                width: 24,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.results,
              style:
                  _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            const Expanded(child: SearchResultsTabbar()),
          ],
        ),
      ),
    );
  }
}
