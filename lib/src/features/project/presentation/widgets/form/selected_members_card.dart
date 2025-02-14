// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

class SelectedMembersCard extends StatelessWidget {
  final String name;
  const SelectedMembersCard({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
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
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          children: [
            Row(
              children: [
                const CircleImageAvatar(
                  color: AppColors.midnight,
                  radius: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    name,
                    style: _textTheme.bodyLarge!
                        .copyWith(letterSpacing: 0, height: 1),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              AppStrings.tap,
              style: _textTheme.labelLarge,
            ),
          ],
        ),
      ),
    );
  }
}
