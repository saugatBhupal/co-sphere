import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AccountTextspan extends StatelessWidget {
  final String infoText;
  final String functionText;
  final Alignment? align;
  final double fontSize;
  final VoidCallback onPressed;
  const AccountTextspan({
    super.key,
    required this.infoText,
    required this.functionText,
    required this.onPressed,
    this.align = Alignment.center,
    this.fontSize = 17,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align ?? Alignment.center,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: infoText,
              style: TextStyle(
                color: AppColors.grey,
                fontFamily: AppFonts.albertSans,
                fontSize: fontSize,
                fontWeight: FontWeight.w300,
              ),
            ),
            TextSpan(
              text: functionText,
              style: TextStyle(
                color: AppColors.midnight,
                fontFamily: AppFonts.albertSans,
                fontSize: fontSize + 1,
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
