import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardBottomNavBar extends StatelessWidget {
  const DashboardBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      onTap: (index) {},
      items: [
        _bottomNavIcon(AppIcons.dashboard, AppIcons.dashboard),
        _bottomNavIcon(AppIcons.explore, AppIcons.explore),
        _bottomNavIcon(AppIcons.create, AppIcons.create),
        _bottomNavIcon(AppIcons.task, AppIcons.task),
        _bottomNavIcon(AppIcons.profile, AppIcons.profile),
      ],
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(fontSize: 6),
      unselectedLabelStyle: const TextStyle(fontSize: 6),
    );
  }
}

BottomNavigationBarItem _bottomNavIcon(
    String unselectedIconPath, String selectedIconPath) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
      unselectedIconPath,
    ),
    activeIcon: SvgPicture.asset(
      selectedIconPath,
    ),
    label: "",
  );
}
