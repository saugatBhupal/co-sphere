import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

class UserLocationDetails extends StatelessWidget {
  final User user;
  const UserLocationDetails({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleImageAvatar(
            imageUrl: user.profileImage, radius: context.isTablet ? 26 : 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullname,
                style: _textTheme.bodyLarge!.copyWith(
                  letterSpacing: 0.4,
                  height: 1,
                  fontSize: context.isTablet ? 18 : 14,
                ),
              ),
              Text(
                "${user.city} ${user.country}",
                style: _textTheme.labelLarge!.copyWith(
                  fontSize: context.isTablet ? 14 : 10,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
