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
        CircleImageAvatar(imageUrl: user.profileImage),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.fullname,
                style: _textTheme.bodyLarge!
                    .copyWith(letterSpacing: 0.4, height: 1),
              ),
              Text(
                "${user.city} ${user.country}",
                style: _textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
