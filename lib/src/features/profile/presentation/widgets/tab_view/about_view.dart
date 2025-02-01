import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.symmetric(horizontal: 14),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
            ),
      ),
      const SizedBox(height: 4),
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
