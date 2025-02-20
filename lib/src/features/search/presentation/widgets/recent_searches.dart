import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 8),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: AppColors.plaster, width: 0.8),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.clock,
                height: 20,
                width: 20,
                colorFilter:
                    const ColorFilter.mode(Color(0xFF949292), BlendMode.srcIn),
              ),
              const SizedBox(width: 6),
              Text(
                AppStrings.recent,
                style:
                    _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Row(
            children: [
              SvgPicture.asset(
                AppIcons.search,
                height: 20,
                width: 20,
              ),
              const SizedBox(width: 6),
              Text(
                "Developer",
                style: _textTheme.bodyMedium!.copyWith(color: AppColors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
