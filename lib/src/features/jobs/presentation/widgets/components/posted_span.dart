import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PostedSpan extends StatelessWidget {
  const PostedSpan({super.key});

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        SvgPicture.asset(
          AppIcons.clock,
        ),
        const SizedBox(width: 6),
        Text("Posted 6 hours ago",
            style: _textTheme.bodySmall!
                .copyWith(fontWeight: FontThickness.regular, letterSpacing: 0)),
      ],
    );
  }
}
