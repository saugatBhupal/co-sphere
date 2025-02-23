import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.white,
      centerTitle: true,
      shape:
          const Border(bottom: BorderSide(color: AppColors.plaster, width: 1)),
      title: Text(
        title,
        style: _textTheme.titleSmall!.copyWith(
            fontWeight: FontThickness.medium,
            color: AppColors.black,
            fontSize: context.isTablet ? 20 : 16),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
