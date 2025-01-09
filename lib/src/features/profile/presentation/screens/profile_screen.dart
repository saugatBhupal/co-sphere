import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  color: AppColors.midnight,
                  height: context.height / 5.8,
                  width: context.width,
                ),
                Positioned(
                  bottom: -50,
                  left: context.width / 2 - 50,
                  child: const CircleImageAvatar(radius: 50),
                ),
              ],
            ),
            const SizedBox(height: 55),
            Text(
              "Sarina Magar",
              style: _theme.titleMedium!.copyWith(height: 1),
            ),
            Text(
              "Kathmandu, Nepal",
              style: _theme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
