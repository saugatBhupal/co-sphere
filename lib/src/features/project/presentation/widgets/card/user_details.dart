import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const CircleImageAvatar(color: AppColors.midnight),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leslie Alexander",
                style: _textTheme.bodyLarge!
                    .copyWith(letterSpacing: 0.4, height: 1),
              ),
              Text(
                "1h ago",
                style: _textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
