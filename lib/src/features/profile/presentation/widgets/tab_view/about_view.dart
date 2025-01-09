import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfo(
            "Jimmy Sulluvan",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris viverra pharetra ligula, nec mattis quam porta vitae. Nullam a congue neque, nec volutpat justo. Nullam et est condimentum, bibendum neque id, congue quam. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum magna lacus, aliquam ut sapien quis, dignissim mattis lectus. Fusce facilisis diam magna, sit amet feugiat metus hendrerit.",
            context,
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              _buildInfo(AppStrings.address, "Kathmandu, Nepal", context),
              const SizedBox(width: 60),
              _buildInfo(AppStrings.joined, "May 23, 2024", context),
            ],
          ),
          const SizedBox(height: 22),
          _buildInfo(AppStrings.contact,
              "User has decided not to disclose this data.", context),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}

Widget _buildInfo(String title, String subtitle, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontThickness.semiBold,
              color: AppColors.grey,
            ),
      ),
      Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColors.silver,
              height: 0,
            ),
      ),
    ],
  );
}
