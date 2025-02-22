import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/jobs/presentation/widgets/components/user_location_details.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class MembersCard extends StatelessWidget {
  final User member;
  const MembersCard({
    Key? key,
    required this.member,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: const BoxDecoration(
        color: AppColors.white,
        border: Border(
          top: BorderSide(color: AppColors.plaster, width: 0.5),
          bottom: BorderSide(color: AppColors.plaster, width: 0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: UserLocationDetails(user: member),
      ),
    );
  }
}
