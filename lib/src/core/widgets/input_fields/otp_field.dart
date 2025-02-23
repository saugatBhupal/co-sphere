import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpField extends StatefulWidget {
  final List<TextEditingController> controllers;
  const OtpField({super.key, required this.controllers});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());
  @override
  void dispose() {
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        6,
        (index) {
          return Container(
            width: context.isTablet ? 80 : 50,
            height: context.isTablet ? 80 : 50,
            margin: EdgeInsets.only(right: context.isTablet ? 8 : 4.6),
            child: TextFormField(
              controller: widget.controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              cursorColor: AppColors.grey,
              style: _textTheme.titleSmall!.copyWith(
                  fontSize: context.isTablet ? 24 : 18,
                  color: AppColors.midnight),
              textAlign: TextAlign.center,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: context.isTablet ? 20 : 6,
                  horizontal: 16,
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.dim,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.dim,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.dim,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: AppColors.red,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).requestFocus(focusNodes[index + 1]);
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).requestFocus(focusNodes[index - 1]);
                }
              },
            ),
          );
        },
      ),
    );
  }
}
