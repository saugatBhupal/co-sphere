import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobDetailsHeader extends StatelessWidget {
  const JobDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Develop a Mobile App for Food Delivery",
          style: _textTheme.headlineSmall!.copyWith(height: 1.2, fontSize: 20),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            SvgPicture.asset(
              AppIcons.clock,
            ),
            const SizedBox(width: 6),
            Text("Posted 6 hours ago",
                style: _textTheme.bodySmall!.copyWith(
                    fontWeight: FontThickness.regular, letterSpacing: 0)),
            const SizedBox(width: 12),
            Container(
              decoration: BoxDecoration(
                color: AppColors.green,
                borderRadius: BorderRadius.circular(4),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6.5, vertical: 4),
              child: Text(
                "रु 2000 - रु 7000",
                style: _textTheme.labelSmall!.copyWith(
                  fontWeight: FontThickness.semiBold,
                  color: AppColors.frog,
                ),
              ),
            ),
            const Spacer(),
            const FunctionButton(icon: AppIcons.heart),
            const SizedBox(width: 8),
            const FunctionButton(icon: AppIcons.share),
          ],
        ),
      ],
    );
  }
}
