import 'package:flutter/material.dart';

import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/widgets/circle_image_avatar.dart';

class ProjectOwnerDetails extends StatelessWidget {
  final User postedBy;
  const ProjectOwnerDetails({
    super.key,
    required this.postedBy,
  });

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleImageAvatar(imageUrl: postedBy.profileImage),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                postedBy.fullname,
                style: _textTheme.bodyLarge!
                    .copyWith(letterSpacing: 0.4, height: 1),
              ),
              Text(
                "${postedBy.city} ${postedBy.country}",
                style: _textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
