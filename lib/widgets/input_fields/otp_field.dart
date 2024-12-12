import 'package:cosphere/constants/app_colors.dart';
import 'package:cosphere/constants/app_fonts.dart';
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        6,
        (index) {
          return Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 4.6),
            child: TextFormField(
              controller: widget.controllers[index],
              focusNode: focusNodes[index],
              keyboardType: TextInputType.number,
              cursorColor: AppColors.grey,
              style: const TextStyle(
                color: AppColors.midnight,
                fontFamily: AppFonts.albertSans,
                fontWeight: FontWeight.w500,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
              maxLength: 1,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: InputDecoration(
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
