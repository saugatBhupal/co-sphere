import 'package:cosphere/src/core/utils/from_to_date.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';

class AboutView extends StatelessWidget {
  final User user;
  const AboutView({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      margin: const EdgeInsets.only(right: 14, left: 14, bottom: 14),
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
            user.fullname,
            user.about ?? "About not added",
            context,
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              _buildInfo(AppStrings.address,
                  "${user.city} ${user.province} ${user.country}", context),
              const SizedBox(width: 40),
              _buildInfo(
                  AppStrings.joined, formatDate(user.createdAt!), context),
            ],
          ),
          const SizedBox(height: 22),
          _buildInfo(AppStrings.contact, user.phone, context),
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
            fontSize: context.isTablet ? 18 : 14),
      ),
      const SizedBox(height: 4),
      Text(
        subtitle,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColors.silver,
            height: 0,
            fontWeight: context.isTablet
                ? FontThickness.regular
                : FontThickness.semiBold,
            fontSize: context.isTablet ? 18 : 14),
      ),
    ],
  );
}
