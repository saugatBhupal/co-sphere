import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/features/dashboard/presentation/widgets/components/completion_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 18),
          width: context.width,
          height: context.height / 3.8,
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(width: 1, color: AppColors.plaster),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1.7,
            children: [
              _buildGridItem(
                context,
                title: AppStrings.level,
                subtitle: "New",
                bottom: true,
                right: true,
                font: 20,
                widget: SvgPicture.asset(
                  AppIcons.trophy,
                ),
              ),
              _buildGridItem(
                context,
                title: AppStrings.success,
                subtitle: "6",
                bottom: true,
                widget: const CompletionContainer(
                  total: 10,
                  completed: 4,
                  color: AppColors.midnight,
                ),
              ),
              _buildGridItem(
                context,
                title: AppStrings.rating,
                subtitle: "4.0",
                right: true,
                widget: const CompletionContainer(
                  total: 10,
                  completed: 4,
                  color: AppColors.blue,
                ),
              ),
              _buildGridItem(
                context,
                title: AppStrings.tasks,
                subtitle: "6",
                total: "8",
              ),
            ],
          ),
        ),
        _buildListItem(
          context,
          title: AppStrings.clients,
          completed: "6",
          total: "12",
        ),
        _buildListItem(context,
            title: AppStrings.applicants,
            completed: "3",
            total: "11",
            bottomLeft: true),
      ],
    );
  }
}

Widget _buildGridItem(
  BuildContext context, {
  required String title,
  required String subtitle,
  Widget? widget,
  String? total,
  double? font,
  bool right = false,
  bool bottom = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
    decoration: BoxDecoration(
      border: Border(
        right: right
            ? const BorderSide(width: 1, color: AppColors.plaster)
            : BorderSide.none,
        bottom: bottom
            ? const BorderSide(width: 1, color: AppColors.plaster)
            : BorderSide.none,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            if (subtitle.isNotEmpty) ...[
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          fontSize: font ?? 36,
                          height: font != null ? 2.2 : null,
                        ),
                  ),
                  if (total != null)
                    Text(
                      " / $total",
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: AppColors.silver),
                    ),
                ],
              ),
            ],
          ],
        ),
        if (widget != null) widget,
      ],
    ),
  );
}

Container _buildListItem(
  BuildContext context, {
  required String title,
  required String completed,
  required String total,
  bool bottomLeft = false,
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    width: context.width,
    height: context.height / 15.5,
    decoration: BoxDecoration(
      color: AppColors.white,
      border: const Border(
        right: BorderSide(width: 1, color: AppColors.plaster),
        left: BorderSide(width: 1, color: AppColors.plaster),
        bottom: BorderSide(width: 1, color: AppColors.plaster),
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: bottomLeft ? const Radius.circular(16) : Radius.zero,
        bottomRight: bottomLeft ? const Radius.circular(16) : Radius.zero,
      ),
    ),
    child: Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const Spacer(),
        Text(
          completed,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.black),
        ),
        Text(
          " / $total",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: AppColors.silver),
        ),
      ],
    ),
  );
}
