import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostedSpan extends StatelessWidget {
  final String posted;
  const PostedSpan({super.key, this.posted = "6 hours ago"});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.clock,
          height: context.isTablet ? 26 : null,
        ),
        const SizedBox(width: 6),
        Text("Posted $posted",
            style: _textTheme.bodySmall!.copyWith(
                fontWeight: FontThickness.regular,
                letterSpacing: 0,
                fontSize: context.isTablet ? 16 : 12)),
      ],
    );
  }
}
