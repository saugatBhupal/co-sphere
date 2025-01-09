import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: AppColors.midnight,
          height: context.height / 6,
          width: context.width,
        ),
        Positioned(
          bottom: -50,
          left: context.width / 2 - 48,
          child: const CircleImageAvatar(radius: 48),
        ),
      ],
    );
  }
}
