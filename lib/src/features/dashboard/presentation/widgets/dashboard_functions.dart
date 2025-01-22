import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardFunctions extends StatelessWidget {
  const DashboardFunctions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: const SearchTextField()),
        Padding(
          padding: const EdgeInsets.only(right: 14, left: 22),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.chatLogs,
              );
            },
            child: SvgPicture.asset(
              AppIcons.chat,
            ),
          ),
        ),
        SvgPicture.asset(
          AppIcons.notification,
        ),
      ],
    );
  }
}
