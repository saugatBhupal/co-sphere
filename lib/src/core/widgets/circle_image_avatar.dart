import 'dart:io';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class CircleImageAvatar extends StatelessWidget {
  final double? radius;
  final bool? enableNavigate;
  final String? imageUrl;

  const CircleImageAvatar({
    super.key,
    this.radius,
    this.enableNavigate,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enableNavigate != null && !enableNavigate!
          ? null
          : () {
              // Navigator.of(context).pushNamed(
              //   Routes.profileScreen,
              //   arguments: personInfo,
              // );
            },
      child: ClipOval(
        child: SizedBox.fromSize(
          size: Size.fromRadius(radius ?? 20),
          child: imageUrl != null && imageUrl!.isNotEmpty
              ? (isNetworkImage(imageUrl!)
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      File(imageUrl!),
                      fit: BoxFit.cover,
                    ))
              : const ImageBuilder(
                  imageUrl: AppImages.profile,
                ),
        ),
      ),
    );
  }

  bool isNetworkImage(String url) {
    return url.startsWith('http') || url.startsWith('https');
  }
}
