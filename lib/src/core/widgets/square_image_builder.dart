import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';

class PlaceholderImage extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double? height;
  final bool isSquare;
  final Color? backgroundColor;
  final Color? textColor;

  const PlaceholderImage({
    super.key,
    required this.title,
    this.imageUrl,
    this.height,
    this.isSquare = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    double size = height ?? (context.isTablet ? 50 : 40);
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.genie,
        shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: isSquare ? BorderRadius.circular(10) : null,
      ),
      child: imageUrl != null && imageUrl!.isNotEmpty
          ? ClipRRect(
              borderRadius: isSquare
                  ? BorderRadius.circular(10)
                  : BorderRadius.circular(size / 2),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(size),
              ),
            )
          : _buildFallback(size),
    );
  }

  Widget _buildFallback(double size) {
    return Center(
      child: Text(
        title.isNotEmpty ? title.toUpperCase() : "?",
        style: TextStyle(
          fontSize: size * 0.5,
          fontWeight: FontWeight.w500,
          color: textColor ?? AppColors.winter,
        ),
      ),
    );
  }
}
