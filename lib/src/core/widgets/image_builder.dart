import 'package:cached_network_image/cached_network_image.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ImageBuilder extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const ImageBuilder({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => _buildImageShimmer(),
        errorWidget: (context, url, error) => Image(
          image: const AssetImage(AppImages.user),
          fit: BoxFit.cover,
          width: context.width,
        ),
        width: width ?? context.width,
        height: height ?? context.height,
        fit: fit ?? BoxFit.cover,
      ),
    );
  }
}

Shimmer _buildImageShimmer() {
  return Shimmer.fromColors(
    baseColor: AppColors.midnight.withOpacity(.10),
    highlightColor: AppColors.midnight.withOpacity(.2),
    child: Container(
      color: AppColors.black,
    ),
  );
}
