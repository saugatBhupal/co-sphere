import 'package:cosphere/src/config/app_routes/app_routes.dart';
import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardFunctions extends StatelessWidget {
  final User user;
  const DashboardFunctions({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: SearchTextField()),
        Padding(
          padding: const EdgeInsets.only(right: 14, left: 22),
          child: GestureDetector(
            onTap: () => Navigator.of(context)
                .pushNamed(AppRoutes.chatLogs, arguments: user),
            child: SvgPicture.asset(
              AppIcons.chat,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(AppRoutes.profile, arguments: user),
          child: SvgPicture.asset(
            AppIcons.notification,
          ),
        ),
      ],
    );
  }
}
