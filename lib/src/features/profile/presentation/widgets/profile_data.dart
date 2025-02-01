import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class ProfileData extends StatelessWidget {
  final String name;
  final String country;
  final String city;
  const ProfileData(
      {super.key,
      required this.name,
      required this.city,
      required this.country});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Text(
            name,
            style: _textTheme.titleLarge!
                .copyWith(height: 1.2, fontWeight: FontThickness.medium),
          ),
          Text(
            "$city, $country",
            style: _textTheme.titleSmall!
                .copyWith(color: AppColors.grey.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }
}
