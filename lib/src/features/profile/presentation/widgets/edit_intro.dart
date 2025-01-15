import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';

import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/textspan_field.dart';
import 'package:flutter/material.dart';

class EditIntro extends StatefulWidget {
  const EditIntro({super.key});

  @override
  State<EditIntro> createState() => _EditIntroState();
}

class _EditIntroState extends State<EditIntro> {
  late final TextEditingController _aboutController;
  late final TextEditingController _overviewController;

  @override
  void initState() {
    super.initState();
    _aboutController = TextEditingController();
    _overviewController = TextEditingController();
  }

  @override
  void dispose() {
    _aboutController.dispose();
    _overviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _gap = SizedBox(height: 20);
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(width: 0.4, color: AppColors.plaster),
      ),
      child: Column(
        children: [
          TextspanField(
            textController: _aboutController,
            label: AppStrings.about,
          ),
          _gap,
          TextspanField(
            textController: _overviewController,
            label: "${AppStrings.professional} ${AppStrings.overview}",
          ),
          _gap,
          DarkRoundedButton(
            title: AppStrings.save,
            height: context.height / 20,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}
