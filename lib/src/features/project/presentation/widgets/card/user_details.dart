import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/square_image_builder.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String name;
  final String applied;
  final String? imageUrl;
  const UserDetails(
      {super.key,
      this.applied = "1h ago",
      this.name = "Saugat",
      this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        PlaceholderImage(
            title: name[0],
            imageUrl: imageUrl,
            height: context.isTablet ? 40 : 32),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: textTheme.bodyLarge!.copyWith(
                    letterSpacing: 0.4,
                    height: 1,
                    fontSize: context.isTablet ? 18 : 14),
              ),
              Text(
                applied,
                style: textTheme.labelLarge!
                    .copyWith(fontSize: context.isTablet ? 14 : 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
