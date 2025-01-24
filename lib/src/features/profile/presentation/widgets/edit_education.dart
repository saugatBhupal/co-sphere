import 'package:cosphere/src/core/constants/app_colors.dart';
import 'package:cosphere/src/core/constants/app_strings.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:cosphere/src/core/widgets/buttons/dark_rounded_button.dart';
import 'package:cosphere/src/core/widgets/input_fields/input_field.dart';
import 'package:flutter/material.dart';

class EditEducation extends StatefulWidget {
  const EditEducation({super.key});

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  late final TextEditingController _organizationController;
  late final TextEditingController _degreeController;
  late final TextEditingController _fromController;
  late final TextEditingController _toController;

  @override
  void initState() {
    super.initState();
    _organizationController = TextEditingController();
    _degreeController = TextEditingController();
    _fromController = TextEditingController();
    _toController = TextEditingController();
  }

  @override
  void dispose() {
    _organizationController.dispose();
    _degreeController.dispose();
    _fromController.dispose();
    _toController.dispose();
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
          InputField(
            textController: _organizationController,
            label: AppStrings.school,
          ),
          _gap,
          InputField(
            textController: _degreeController,
            label: "${AppStrings.degree}/${AppStrings.qualification}",
          ),
          _gap,
          Row(
            children: [
              Flexible(
                flex: 1,
                child: InputField(
                  textController: _fromController,
                  label: AppStrings.from,
                  hintText: "2022",
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                flex: 1,
                child: InputField(
                  textController: _toController,
                  label: AppStrings.to,
                  hintText: "2023",
                ),
              ),
            ],
          ),
          _gap,
          DarkRoundedButton(
            title:
                "${AppStrings.add} ${AppStrings.education} ${AppStrings.history}",
            height: context.height / 20,
            fontSize: 14,
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ],
      ),
    );
  }
}
