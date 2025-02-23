import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AccountTextspan extends StatelessWidget {
  final String infoText;
  final String functionText;
  final Alignment? align;
  final VoidCallback onPressed;
  final double? fontSize;

  const AccountTextspan({
    super.key,
    required this.infoText,
    required this.functionText,
    required this.onPressed,
    this.align = Alignment.center,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    final isTablet = context.isTablet;
    final defaultFontSize = fontSize ?? (isTablet ? 22 : 16);
    final defaultFunctionFontSize = defaultFontSize + 2;

    return Align(
      alignment: align ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: infoText,
              style: _theme.textTheme.titleLarge!.copyWith(
                color: AppColors.grey,
                fontSize: defaultFontSize,
              ),
            ),
            TextSpan(
              text: functionText,
              style: _theme.textTheme.titleLarge!.copyWith(
                color: AppColors.midnight,
                fontSize: defaultFunctionFontSize,
                fontWeight: FontWeight.w500,
              ),
              recognizer: TapGestureRecognizer()..onTap = onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
