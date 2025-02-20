import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class RecentSearches extends StatelessWidget {
  const RecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.recent,
          style: _textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            "Developer",
            style: _textTheme.bodyLarge!.copyWith(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            "Developer",
            style: _textTheme.bodyLarge!.copyWith(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            "Developer",
            style: _textTheme.bodyLarge!.copyWith(),
          ),
        ),
      ],
    );
  }
}
