import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/search_bar.dart';
import 'package:flutter/material.dart';

class SearchFieldAppbar extends StatelessWidget implements PreferredSizeWidget {
  const SearchFieldAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.black),
      centerTitle: true,
      title: const Center(child: SearchTextField()),
      shape: const Border(
          bottom: BorderSide(color: AppColors.plaster, width: 0.6)),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
