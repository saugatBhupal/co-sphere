import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return AppBar(
      shape:
          const Border(bottom: BorderSide(color: AppColors.plaster, width: 1)),
      title: Text(
        title,
        style: _textTheme.titleLarge!
            .copyWith(fontWeight: FontThickness.medium, color: AppColors.black),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
