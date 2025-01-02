import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class CircleImageAvatar extends StatelessWidget {
  final double? radius;
  final bool? enableNavigate;
  // final PersonInfo personInfo;
  const CircleImageAvatar({
    super.key,
    this.radius,
    this.enableNavigate,
    // required this.personInfo,
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
          child: const ImageBuilder(
            imageUrl: AppImages.profile,
          ),
        ),
      ),
    );
  }
}
