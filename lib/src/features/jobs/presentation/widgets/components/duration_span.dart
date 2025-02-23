import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/functions/date_time_utils.dart';
import 'package:cosphere/src/core/widgets/buttons/function_button.dart';
import 'package:cosphere/src/core/widgets/image_builder.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:flutter/material.dart';

class DurationSpan extends StatelessWidget {
  final DurationTime? duration;
  final DateTime? postedOn;
  const DurationSpan({super.key, this.duration, this.postedOn});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        const FunctionButton(icon: AppIcons.calender),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              duration != null && duration != DurationTime.initial()
                  ? "${duration!.from.toString()}-${duration!.to.toString()} Days"
                  : extractDate(postedOn!),
              style: _textTheme.bodySmall!.copyWith(
                  height: 1,
                  color: AppColors.black,
                  fontSize: context.isTablet ? 16 : 12,
                  fontWeight: FontThickness.regular),
            ),
            Text(
              duration != null && duration != DurationTime.initial()
                  ? AppStrings.duration
                  : AppStrings.posted,
              style: _textTheme.labelLarge!
                  .copyWith(height: 1, fontSize: context.isTablet ? 14 : 10),
            ),
          ],
        ),
      ],
    );
  }
}
