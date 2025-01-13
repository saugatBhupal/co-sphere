import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardFunctions extends StatefulWidget {
  const DashboardFunctions({super.key});

  @override
  State<DashboardFunctions> createState() => _DashboardFunctionsState();
}

class _DashboardFunctionsState extends State<DashboardFunctions> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: SearchTextField(
          controller: _searchController,
        )),
        Padding(
          padding: const EdgeInsets.only(right: 14, left: 22),
          child: SvgPicture.asset(
            AppIcons.chat,
          ),
        ),
        SvgPicture.asset(
          AppIcons.notification,
        ),
      ],
    );
  }
}
