import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MessageTextField extends StatefulWidget {
  MessageTextField({
    super.key,
  });

  @override
  State<MessageTextField> createState() => _MessageTextFieldState();
}

class _MessageTextFieldState extends State<MessageTextField> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 14),
      child: TextFormField(
        controller: _textController,
        keyboardType: TextInputType.text,
        cursorColor: AppColors.black,
        style: _textTheme.titleSmall!
            .copyWith(fontSize: 15, color: AppColors.midnight, height: 2),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          filled: true,
          fillColor: AppColors.white,
          hintText: AppStrings.messageHint,
          hintStyle: _textTheme.titleSmall!
              .copyWith(color: AppColors.grey, fontWeight: FontThickness.light),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 16, left: 18),
            child: SvgPicture.asset(
              AppIcons.send,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: const BorderSide(
              color: AppColors.plaster,
            ),
          ),
        ),
      ),
    );
  }
}
