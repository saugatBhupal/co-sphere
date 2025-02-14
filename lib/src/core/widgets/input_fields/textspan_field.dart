import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_fonts.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextspanField extends StatefulWidget {
  final TextEditingController textController;
  final FormFieldValidator<String>? validator;
  final String label;
  final String? icon;
  final String? hintText;
  final int minLines;
  final int charCount;
  TextspanField({
    super.key,
    required this.textController,
    required this.label,
    this.icon,
    this.hintText,
    this.validator,
    this.minLines = 5,
    this.charCount = 200,
  });

  @override
  State<TextspanField> createState() => _TextspanFieldState();
}

class _TextspanFieldState extends State<TextspanField> {
  late int charCount;

  @override
  void initState() {
    super.initState();
    charCount = widget.textController.text.length;
    widget.textController.addListener(_updateCharCount);
  }

  @override
  void dispose() {
    widget.textController.removeListener(_updateCharCount);
    super.dispose();
  }

  void _updateCharCount() {
    setState(() {
      charCount = widget.textController.text.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        TextFormField(
          controller: widget.textController,
          keyboardType: TextInputType.multiline,
          cursorColor: AppColors.grey,
          validator: widget.validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          style: _textTheme.bodyLarge!
              .copyWith(color: AppColors.grey, letterSpacing: 0),
          maxLines: null,
          minLines: widget.minLines,
          inputFormatters: [
            LengthLimitingTextInputFormatter(widget.charCount),
          ],
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
            hintText: widget.hintText ??
                "${AppStrings.enter} ${widget.label.toLowerCase()}",
            prefixIcon: widget.icon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 10, left: 18),
                    child: Image.asset(
                      widget.icon!,
                      height: 24,
                      width: 24,
                      fit: BoxFit.contain,
                    ),
                  )
                : null,
            labelText: widget.label,
            labelStyle: _textTheme.titleSmall!
                .copyWith(fontWeight: FontThickness.regular),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.4),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.4),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: AppColors.grey.withOpacity(0.4),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColors.red,
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 5,
          child: Text(
            '$charCount/${widget.charCount}',
            style: _textTheme.bodySmall!.copyWith(
                color: AppColors.grey, fontWeight: FontThickness.medium),
          ),
        ),
      ],
    );
  }
}
